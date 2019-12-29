import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hello_world/dashboard/Voter_Panel/voter_detail/votersearch/main.dart';
import './add_voter.dart';
import './firebase_api.dart';
import './voter_model.dart';
import 'package:flutter/material.dart';


class UserAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Votar',
      theme: ThemeData(
        // Define the default Brightness and Colors
        brightness: Brightness.light,
        splashColor: Colors.black12,
        primaryColor: Colors.cyan[600],
        accentColor: Colors.cyan[600],
        // Define the default Font Family
        fontFamily: 'Raleway',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: SafeArea(child: _buildBody(context)),
      floatingActionButton: buildAddVoterFab(),
    );
  }

  buildAddVoterFab() {
    return FloatingActionButton(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: () {
        _navigateToAddVoter();
      },
      child: Icon(Icons.add),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FireBaseAPI.voterStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        if (snapshot.data.documents.length > 0) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 8),
                  child: Text(
                    "Votar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),

                  ),

                ),


                Padding(

                  padding:  EdgeInsets.symmetric(horizontal: 1),
                  child:Row(
                    children: <Widget>[
                   Padding(padding:  EdgeInsets.symmetric(horizontal: 20.0),
                       child: Text(
                    "${snapshot.data.documents.length.toString()} Members",textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),


                  )
                   ),
                      Padding(padding: EdgeInsets.symmetric(horizontal:90),
                           child:IconButton(
                              icon: const Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 20.0,
                             ),
                             onPressed: () {
                           Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Search()),);
                          }
                      )
                      ),

                 ] )),
                _buildPlayerList(context, snapshot.data.documents),
              ],
            ),
          );
        } else {
          return Center(
            child: Text(
              "There is no Voter.",
              style: Theme.of(context).textTheme.title,
            ),
          );
        }
      },
    );
  }

  Widget _buildPlayerList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(

      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 20.0),
      children:
      snapshot.map((data) => _buildVoterItem(context, data)).toList(),
    );
  }

  Widget _buildVoterItem(BuildContext context, DocumentSnapshot data) {
    final voter = Voter.fromSnapshot(data);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Slidable.builder(
        delegate: SlidableStrechDelegate(),
        secondaryActionDelegate: new SlideActionBuilderDelegate(
            actionCount: 2,
            builder: (context, index, animation, renderingMode) {
              if (index == 0) {
                return new IconSlideAction(
                  caption: 'Edit',
                  color: Colors.blue,
                  icon: Icons.edit,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddVoterDialog(
                        docId: data.documentID,
                        name: voter.name,
                        email: voter.email,
                        mobile: voter.mobile,

                        roll:voter.roll,

                      ),
                      fullscreenDialog: true,
                    ),
                  ),
                  closeOnTap: false,
                );
              } else {
                return new IconSlideAction(
                  caption: 'Delete',
                  closeOnTap: false,
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () =>
                      _buildConfirmationDialog(context, data.documentID),
                );
              }
            }),
        key: Key(voter.name),


        child: ListTile(

          title: Text(voter.name,style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          subtitle: Text(voter.roll),

          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddVoterDialog(
                docId: data.documentID,
                name: voter.name,
                email: voter.email,
                mobile: voter.mobile,

                roll:voter.roll,

              ),
              fullscreenDialog: true,
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _buildConfirmationDialog(
      BuildContext context, String documentID) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete'),
          content: Text('Voter will be deleted'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            FlatButton(
                child: Text('Delete'),
                onPressed: () {
                  FireBaseAPI.removeVoter(documentID);
                  Navigator.of(context).pop(true);
                }),
          ],
        );
      },
    );
  }

  void _navigateToAddVoter() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddVoterDialog(),
        fullscreenDialog: true,
      ),
    );
  }
}

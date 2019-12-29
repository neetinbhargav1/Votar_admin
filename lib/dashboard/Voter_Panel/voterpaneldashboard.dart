import 'package:flutter/material.dart';
import 'package:hello_world/dashboard/Result/Post_list.dart';
import 'package:hello_world/dashboard/Voter_Panel/add_voter/ragistration.dart';
import 'package:hello_world/dashboard/Voter_Panel/voter_detail/main.dart';

import 'package:hello_world/login/logout/logout.dart';
import 'package:hello_world/login/main.dart';
import 'package:local_auth/local_auth.dart';

class VoterDashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Votar Admin",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        dividerColor: Colors.grey,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Votar'),
        actions: <Widget>[
//            PopupMenuButton<int>(
//            icon: Icon(Icons.more_vert),
//            itemBuilder: (BuildContext context) {
//              return <PopupMenuEntry<int>>[
//                PopupMenuItem(
//                  value: 0,
//                  child: Text('Login'),
//                ),
//                PopupMenuItem(
//                  value: 1,
//                  child: Text('Einstellungen'),
//                ),
//                PopupMenuItem(
//                  value: 2,
//                  child: Text('Download-Container'),
//                ),
//                PopupMenuItem(
//                  value: 2,
//                  child: Text('Soziale Netzwerke'),
//                ),
//                PopupMenuItem(
//                  value: 3,
//                  child: Text('FAQ'),
//                ),
//
//              ];
//            },
//          ),
        ],
      ),
      body: IconTheme.merge(
        data: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                ],
              ),
            ),
            Column(
                children: <Widget>[
                 DashboardButton(
                      icon: Icons.add_box,
                      text: 'Add Voter',
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute (builder: (context)=>SignUpScreen1()),);

                      },
                    ),

                 Padding(padding: EdgeInsets.only(top: 50,),
                   child:DashboardButton(
                      icon: Icons.assignment,
                      text: 'Voter Detail',
                      onTap: () {
                        Navigator.push(context,
                        MaterialPageRoute (builder: (context)=>UserAdd()),);
                      },
                    ),


                 )],
              ),

//            Expanded(
//              child: Row(
//                children: <Widget>[
//                  Expanded(
//                    child: DashboardButton(
//                      icon: Icons.person,
//                      text: 'Veranstaltungen',
//                      onTap: () {},
//                    ),
//                  ),
//                  Expanded(
//                    child: DashboardButton(
//                      icon: Icons.person,
//                      text: 'Termine',
//                      onTap: () {},
//                    ),
//                  ),
//                  Expanded(
//                    child: DashboardButton(
//                      icon: Icons.person,
//                      text: 'Prufengen',
//                      onTap: () {},
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            Expanded(
//              child: Row(
//                children: <Widget>[
//                  Expanded(
//                    child: DashboardButton(
//                      icon: Icons.person,
//                      text: 'Ansprechpartner',
//                      onTap: () {},
//                    ),
//                  ),
//                  Expanded(
//                    child: DashboardButton(
//                      icon: Icons.person,
//                      text: 'Modulportal',
//                      onTap: () {},
//                    ),
//                  ),
//                  Expanded(
//                    child: DashboardButton(
//                      icon: Icons.book,
//                      text: 'Literaturrecherche',
//                      onTap: () {},
//                    ),
//                  ),
//                ],
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  const DashboardButton({
    Key key,
    @required this.icon,
    @required this.text,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FractionallySizedBox(
              widthFactor: 0.310,
              child: FittedBox(
                child: Icon(icon),
              ),
            ),
            SizedBox(height: 1.0),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1.1,
            ),
            SizedBox(height: 1.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200.0),
            ),
          ],
        ),
      ),
    );
  }
}
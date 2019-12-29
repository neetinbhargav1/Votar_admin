import 'package:flutter/material.dart';
import 'package:hello_world/dashboard/Result/Post_list.dart';
import 'package:hello_world/dashboard/Voter_Panel/add_voter/ragistration.dart';
import 'package:hello_world/dashboard/Voter_Panel/voterpaneldashboard.dart';
//import 'package:hello_world/dashboard/Manage_voter/main.dart';

import 'package:hello_world/login/logout/logout.dart';
import 'package:hello_world/login/main.dart';
import 'package:local_auth/local_auth.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Votar Admin',

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
        title: Text('DASHBOARD'),
        actions: <Widget>[
//
        ],
      ),
      body: IconTheme.merge(
        data: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.dashboard, size: 58.0),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Assam Engineering College',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,fontSize: 20
                              ),
                            ),
                            Text('Guwahati',style: const TextStyle(
                                fontSize: 15
                            ),),
                          ],
                        ),
                      ),

                    ],
                  ),
                  Divider(height: 1.0),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0) ,
            child: Column(
                children: <Widget>[
                   DashboardButton(
                      icon: Icons.assessment,
                      text: 'Result',

                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute (builder: (context)=>PostList()),);

                      },
                    ),

                   DashboardButton(
                      icon: Icons.group,
                      text: 'Voter Panel',
                      onTap: () {
                        Navigator.push(context,
                        MaterialPageRoute (builder: (context)=>VoterDashBoard()),);
                      },
                    ),

                   DashboardButton(
                      icon: Icons.delete_outline,
                      text: 'Log Out',
                      onTap: () {

                         {
                          Navigator.push(context,
                            MaterialPageRoute (builder: (context)=>LogOut()),);
                        };
                      },

                  ),
                ],
              ),
            ),


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
          children: <Widget>[
            FractionallySizedBox(
              widthFactor: 0.275,
              child: FittedBox(
                child: Icon(icon),
              ),
            ),
            SizedBox(height: 1.5),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1.0,
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
//              child: Divider(height: 0.5),
            ),
          ],
        ),
      ),
    );
  }
}
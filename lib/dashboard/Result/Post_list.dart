
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:hello_world/dashboard/Result/cultural_secretary/main.dart';
import 'package:hello_world/dashboard/Result/football_secretary/main.dart';
import 'package:hello_world/dashboard/Result/general_secretary/main.dart';
import 'package:hello_world/dashboard/Result/general_secretary/screens/result_screen.dart';
import 'package:hello_world/dashboard/Result/social_welfare/main.dart';
import 'package:hello_world/dashboard/Result/training_and_placement_secretary/main.dart';
import 'package:provider/provider.dart';


class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(
        title: Text('Votar'),backgroundColor: Colors.blue,
        actions: <Widget>[
        ],
    ),


        body:Container(
          child:Column(
           children: <Widget>[
               Card(margin: const EdgeInsets.only(left: 5.0, right: 5.0, top: 15.0),color: Colors.lightBlueAccent,
                child: ListTile(
                  title: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text( 'Cultural Secretary', style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)



                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                       MaterialPageRoute (builder: (context)=>CulturalSecretary()),);

                  },
                ),



              ),

             Card(margin: const EdgeInsets.only(left: 5.0, right: 5.0, top: 15.0),color: Colors.lightBlueAccent,
               child: ListTile(
                 title: Container(
                   padding: EdgeInsets.all(20.0),
                   child: Text( 'Football Secretary', style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)



                   ),
                 ),
                 onTap: () {
                   Navigator.push(context,
                     MaterialPageRoute (builder: (context)=>FootballSecretary()),);

                 },
               ),



             ),

             Card(margin: const EdgeInsets.only(left: 5.0, right: 5.0, top: 15.0),color: Colors.lightBlueAccent,
               child: ListTile(
                 title: Container(
                   padding: EdgeInsets.all(20.0),
                   child: Text( 'General Secretary', style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)



                   ),
                 ),
                 onTap: () {

                   Navigator.push(context,
                     MaterialPageRoute (builder: (context)=>GeneralSecretary()),);

                 },
               ),



             ),

             Card(margin: const EdgeInsets.only(left: 5.0, right: 5.0, top: 15.0),color: Colors.lightBlueAccent,
               child: ListTile(
                 title: Container(
                   padding: EdgeInsets.all(20.0),
                   child: Text( 'Social Welfare', style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)



                   ),
                 ),
                 onTap: () {
                   Navigator.push(context,
                     MaterialPageRoute (builder: (context)=>SocialSecretary()),);
                 },
               ),



             ),

             Card(margin: const EdgeInsets.only(left: 5.0, right: 5.0, top: 15.0),color: Colors.lightBlueAccent,
               child: ListTile(
                 title: Container(
                   padding: EdgeInsets.all(20.0),
                   child: Text( 'Training & Placement Secretary', style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)



                   ),
                 ),
                 onTap: () {
                   Navigator.push(context,
                     MaterialPageRoute (builder: (context)=>PlacementSecretary()),);

                 },
               ),



             ),

          ],
        )
    )
    );

  }



}

import 'package:flutter/material.dart';
import 'package:hello_world/dashboard/Result/training_and_placement_secretary/screens/result_screen.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'package:hello_world/dashboard/Result/training_and_placement_secretary/state/vote.dart';



class PlacementSecretary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => VoteState(),
        ),

      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Scaffold(
            appBar: AppBar(title: Text("Votar ")),
                body: HomeScreeen(),
              ),

//              ),
          '/result': (context) => Scaffold(
                appBar: AppBar(
                  title: Text('Result'),

                ),
                body: ResultScreen(),
              ),
        },
      ),
    );
  }


}

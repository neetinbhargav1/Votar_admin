import 'package:flutter/material.dart';
import 'package:hello_world/dashboard/Result/social_welfare/screens/result_screen.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'constants.dart';
import 'package:hello_world/dashboard/Result/social_welfare/state/vote.dart';



class SocialSecretary extends StatelessWidget {
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
            appBar: AppBar(title: Text(kAppName)),
                body: HomeScreeen(),
              ),

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

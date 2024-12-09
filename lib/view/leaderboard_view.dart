import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class LeaderboardView extends StatefulWidget {
  const LeaderboardView({Key? key}) : super(key: key);

  @override
  _MyLeaderboardState createState() => _MyLeaderboardState();
}

class _MyLeaderboardState extends State<LeaderboardView> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Leaderboard coming soon',
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 30,
                    color: HexColor("B22222"),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

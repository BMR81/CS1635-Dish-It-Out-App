import 'package:cs1635_dish_it_out_app/view/profile_view.dart';
import 'package:cs1635_dish_it_out_app/view/saved_view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'home_view.dart';
import 'menu_view.dart';

class LeaderboardView extends StatefulWidget {
  const LeaderboardView({Key? key}) : super(key: key);

  @override
  _MyLeaderboardState createState() => _MyLeaderboardState();
}

class _MyLeaderboardState extends State<LeaderboardView> {
  var _currentIndex = 1;

  List<Route> viewList = [
    MaterialPageRoute(builder: (context) => MenuView()),
    MaterialPageRoute(builder: (context) => LeaderboardView()),
    MaterialPageRoute(builder: (context) => HomeView()),
    MaterialPageRoute(builder: (context) => SavedView()),
    MaterialPageRoute(builder: (context) => ProfileView()),
  ];

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
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          backgroundColor: HexColor('#B22222'),
          unselectedItemColor: HexColor("#FF6347"),
          type: BottomNavigationBarType.fixed,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
              Navigator.pop(context);
              Navigator.push(context, viewList[newIndex]);
            });
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Leaderboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

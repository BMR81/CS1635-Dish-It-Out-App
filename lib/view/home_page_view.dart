import 'package:cs1635_dish_it_out_app/view/leaderboard_view.dart';
import 'package:cs1635_dish_it_out_app/view/profile_view.dart';
import 'package:cs1635_dish_it_out_app/view/saved_view.dart';
import 'package:cs1635_dish_it_out_app/view/widgets/restaurant_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'home_view.dart';

//import 'menu_view.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePageView> {
  var _currentIndex = 1;

  final viewList = [
    //MenuView(),
    LeaderboardView(),
    HomeView(),
    SavedView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: viewList[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: HexColor("#FF6347"),
          backgroundColor: HexColor('#B22222'),
          type: BottomNavigationBarType.fixed,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          currentIndex: _currentIndex,
          items: const [
/*            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),*/
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

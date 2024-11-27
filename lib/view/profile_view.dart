import 'package:cs1635_dish_it_out_app/view/saved_view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../model/static_user.dart';
import 'home_view.dart';
import 'leaderboard_view.dart';
import 'menu_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<ProfileView> {
  String firstDish = StaticUser.user!.firstDish.toString();
  String secondDish = StaticUser.user!.secondDish.toString();
  String thirdDish = StaticUser.user!.thirdDish.toString();

  var _currentIndex = 4;

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
        body: Stack(
          children: [
            // Background 
            Positioned.fill(
              child: Image.asset(
                'assets/images/profileBackground.png', 
                fit: BoxFit.cover,
              ),
            ),
            // UI ELements upfront
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: HexColor("B22222"),
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('assets/images/profilePhoto.png'),
                  ),
                ),
                Text(
                  StaticUser.user!.name.toString(),
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 40,
                    color: HexColor("B22222"),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Divider(color: Colors.white),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Favorite Dishes",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 25,
                        color: HexColor("B22222"),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDishColumn(firstDish),
                    _buildDishColumn(secondDish),
                    _buildDishColumn(thirdDish),
                  ],
                ),
                Divider(color: Colors.white),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Review Log",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 25,
                        color: HexColor("B22222"),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Savor the memories. Start reviewing!",
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 18,
                      color: HexColor("B22222"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          selectedItemColor: HexColor("#F5F5F5"),
          unselectedItemColor: HexColor("#FF6347"),
          backgroundColor: HexColor('#B22222'),
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

  Column _buildDishColumn(String dishName) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset(
            'assets/images/$dishName.png',
            height: 100,
            width: 100,
          ),
        ),
        Text(
          dishName.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 20,
            color: HexColor("B22222"),
          ),
        ),
      ],
    );
  }
}

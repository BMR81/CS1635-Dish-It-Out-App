import 'package:cs1635_dish_it_out_app/view/saved_view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:simple_shadow/simple_shadow.dart';

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SimpleShadow(
              color: Colors.black,
              opacity: 1,
              sigma: 1,
              offset: const Offset(0, 0),
              child: Image.asset(
                'assets/images/profilePhoto.png',
                height: 150,
                width: 300,
              ),
            ),
            Text(
              StaticUser.user!.username.toString(),
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 40,
                  color: HexColor("00abff"),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              color: Colors.black,
            ),
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
                      color: HexColor("00abff"),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(
                        'assets/images/$firstDish.png',
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Text(
                      "1. $firstDish",
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 20,
                        color: HexColor("00abff"),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(
                        'assets/images/$secondDish.png',
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Text(
                      "2. $secondDish",
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 20,
                        color: HexColor("00abff"),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(
                        'assets/images/$thirdDish.png',
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Text(
                      "3. $thirdDish",
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 20,
                        color: HexColor("00abff"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Review Log (coming soon)",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 25,
                      color: HexColor("00abff"),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 200,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          backgroundColor: HexColor('#00abff'),
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

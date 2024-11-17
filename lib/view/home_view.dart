import 'package:cs1635_dish_it_out_app/model/static_user.dart';
import 'package:cs1635_dish_it_out_app/view/leaderboard_view.dart';
import 'package:cs1635_dish_it_out_app/view/profile_view.dart';
import 'package:cs1635_dish_it_out_app/view/saved_view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../view_model/user_view_model.dart';
import 'menu_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key : key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<HomeView> {

  var _userViewModel = UserViewModel();

  var _currentIndex = 2;

  List<Route> viewList = [
    MaterialPageRoute(builder: (context) => MenuView()),
    MaterialPageRoute(builder: (context) => LeaderboardView()),
    MaterialPageRoute(builder: (context) => HomeView()),
    MaterialPageRoute(builder: (context) => SavedView()),
    MaterialPageRoute(builder: (context) => ProfileView()),
  ];


  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  iconSize: 50,
                  padding: EdgeInsets.all(40),
                  onPressed: (){

                  },
                ),
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  iconSize: 50,
                  padding: EdgeInsets.all(40),
                  onPressed: (){

                  },
                ),
                IconButton(
                  icon: Image.asset(
                    "assets/icons/dice.png",
                    width: 50,
                    height: 50,
                  ),
                  padding: EdgeInsets.all(40),
                  onPressed: (){

                  },
                ),
              ],
            ),

          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          backgroundColor: HexColor('#00abff'),
          type: BottomNavigationBarType.fixed,
          onTap: (int newIndex){
            setState(() {
              _currentIndex = newIndex;
              Navigator.push(context, viewList[newIndex]);
            });
          },
          currentIndex: _currentIndex,
          items: const[
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
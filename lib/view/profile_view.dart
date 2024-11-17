import 'package:cs1635_dish_it_out_app/model/user_model.dart';
import 'package:cs1635_dish_it_out_app/view/login_view.dart';
import 'package:cs1635_dish_it_out_app/view/saved_view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../model/static_user.dart';
import '../view_model/user_view_model.dart';
import 'home_view.dart';
import 'leaderboard_view.dart';
import 'menu_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key : key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<ProfileView> {

  var _userViewModel = UserViewModel();

  var _currentUser = user_model();

  var _currentIndex = 4;

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
        body:
          Column(
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
              Text(StaticUser.user!.username.toString()),

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
              Navigator.pop(context);
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
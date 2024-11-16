import 'package:cs1635_dish_it_out_app/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'home_view.dart';
import 'leaderboard_view.dart';
import 'menu_view.dart';

class SavedView extends StatefulWidget {
  const SavedView({Key? key}) : super(key : key);

  @override
  _MySavedState createState() => _MySavedState();
}

class _MySavedState extends State<SavedView> {

  var _currentIndex = 3;

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
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Saved coming soon',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 30,
                    color: HexColor("00abff"),
                    fontWeight: FontWeight.bold
                ),
              ),

            ],
          ),
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
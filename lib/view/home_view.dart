import 'package:cs1635_dish_it_out_app/model/static_restaurant_list.dart';
import 'package:cs1635_dish_it_out_app/model/static_user.dart';
import 'package:cs1635_dish_it_out_app/view/leaderboard_view.dart';
import 'package:cs1635_dish_it_out_app/view/profile_view.dart';
import 'package:cs1635_dish_it_out_app/view/saved_view.dart';
import 'package:cs1635_dish_it_out_app/view/widgets/restaurant_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../view_model/user_view_model.dart';
import 'menu_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<HomeView> {
  var _currentRestaurant = 0;
  var _numRestaurants = StaticRestaurantList.restaurants!.length;

  var _hasMore = true;

  var _currentIndex = 2;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  iconSize: 50,
                  padding: EdgeInsets.all(40),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  iconSize: 50,
                  padding: EdgeInsets.all(40),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset(
                    "assets/icons/dice.png",
                    width: 50,
                    height: 50,
                  ),
                  padding: EdgeInsets.all(40),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: _hasMore && _numRestaurants > 0
                  ? RestaurantCardWidget(
                      restaurant:
                          StaticRestaurantList.restaurants![0])
                  : Padding(
                      padding: EdgeInsets.symmetric(vertical: 100),
                      child: Text(
                        'No more options!',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 40,
                            color: HexColor("00abff"),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(CupertinoIcons.xmark_circle),
                  iconSize: 150,
                  color: Colors.red,
                  padding: EdgeInsets.all(20),
                  onPressed: () {
                    if (_currentRestaurant != _numRestaurants - 1) {
                      setState(() {
                        StaticRestaurantList.restaurants?.removeAt(0);
                        _currentRestaurant = _currentRestaurant + 1;
                      });
                    } else {
                      setState(() {
                        StaticRestaurantList.restaurants?.removeAt(0);
                        _hasMore = false;
                      });
                    }
                  },
                ),
                IconButton(
                  icon: Icon(CupertinoIcons.check_mark_circled),
                  iconSize: 150,
                  color: Colors.green,
                  padding: EdgeInsets.all(20),
                  onPressed: () {
                    if (_currentRestaurant != _numRestaurants - 1) {
                      setState(() {
                        StaticRestaurantList.restaurants?.removeAt(0);
                        _currentRestaurant = _currentRestaurant + 1;
                      });
                    } else {
                      setState(() {
                        StaticRestaurantList.restaurants?.removeAt(0);
                        _hasMore = false;
                      });
                    }
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
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
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

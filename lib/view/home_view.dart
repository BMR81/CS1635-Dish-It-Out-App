import 'package:cs1635_dish_it_out_app/model/static_restaurant_list.dart';
import 'package:cs1635_dish_it_out_app/view/leaderboard_view.dart';
import 'package:cs1635_dish_it_out_app/view/profile_view.dart';
import 'package:cs1635_dish_it_out_app/view/saved_view.dart';
import 'package:cs1635_dish_it_out_app/view/widgets/restaurant_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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

  // Track pressed state
  bool _isXPressed = false;
  bool _isCheckPressed = false;

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
                  icon: Image.asset(
                  "assets/icons/search.png",
                    width: 50,
                    height: 50,
                  ),
                  padding: EdgeInsets.all(40),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset(
                      "assets/icons/like.png",
                    width: 50,
                    height: 50,
                  ),
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
            const SizedBox(height: 50),
            Container(
              child: _hasMore && _numRestaurants > 0
                  ? RestaurantCardWidget(
                restaurant: StaticRestaurantList.restaurants![0],
              )
                  : Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: Text(
                  'Dish it out another time!',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 30,
                    color: HexColor("00abff"),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTapDown: (_) => setState(() => _isXPressed = true),
                  onTapUp: (_) {
                    setState(() => _isXPressed = false);
                    if (_currentRestaurant != _numRestaurants - 1) {
                      setState(() {
                        StaticRestaurantList.restaurants?.removeAt(0);
                        _currentRestaurant++;
                      });
                    } else {
                      setState(() {
                        StaticRestaurantList.restaurants?.removeAt(0);
                        _hasMore = false;
                      });
                    }
                  },
                  onTapCancel: () => setState(() => _isXPressed = false),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _isXPressed
                          ? Colors.red.withOpacity(0.3)
                          : Colors.transparent,
                    ),
                    child: Image.asset(
                      'assets/icons/x_mark.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                GestureDetector(
                  onTapDown: (_) => setState(() => _isCheckPressed = true),
                  onTapUp: (_) {
                    setState(() => _isCheckPressed = false);
                    if (_currentRestaurant != _numRestaurants - 1) {
                      setState(() {
                        StaticRestaurantList.likedRestaurants
                            ?.add(StaticRestaurantList.restaurants![0]);
                        StaticRestaurantList.restaurants?.removeAt(0);
                        _currentRestaurant++;
                      });
                    } else {
                      setState(() {
                        StaticRestaurantList.likedRestaurants
                            ?.add(StaticRestaurantList.restaurants![0]);
                        StaticRestaurantList.restaurants?.removeAt(0);
                        _hasMore = false;
                      });
                    }
                  },
                  onTapCancel: () => setState(() => _isCheckPressed = false),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _isCheckPressed
                          ? Colors.green.withOpacity(0.3)
                          : Colors.transparent,
                    ),
                    child: Image.asset(
                      'assets/icons/check_mark.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
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

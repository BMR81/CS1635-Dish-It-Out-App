import 'package:cs1635_dish_it_out_app/view/profile_view.dart';
import 'package:cs1635_dish_it_out_app/view/widgets/saved_restaurant_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../model/static_restaurant_list.dart';
import 'home_view.dart';
import 'leaderboard_view.dart';
import 'menu_view.dart';

class SavedView extends StatefulWidget {
  const SavedView({Key? key}) : super(key: key);

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

  var _numLikedRestaurants = StaticRestaurantList.likedRestaurants!.length;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            centerTitle: true,
            title: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Saved Restaurants',
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 30,
                    color: HexColor("00abff"),
                    fontWeight: FontWeight.bold),
              ),
            ),
            bottom: TabBar(
              indicatorColor: HexColor("ff5400"),
              labelColor: HexColor("ff5400"),
              tabs: [
                Tab(
                  child: Text(
                    'Liked',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    'Favorites',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            Container(
              child: _numLikedRestaurants > 0
                  ? ListView.builder(
                      itemCount: _numLikedRestaurants,
                      itemBuilder: (context, index) {
                        return SavedRestaurantWidget(
                            restaurant:
                                StaticRestaurantList.likedRestaurants![index]);
                      })
                  : Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Text(
                          'Go like some restaurants!',
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 30,
                              color: HexColor("00abff"),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
            ),
            Container(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Text(
                    'Favorites coming soon',
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 30,
                        color: HexColor("00abff"),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ]),
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
      ),
    );
  }
}

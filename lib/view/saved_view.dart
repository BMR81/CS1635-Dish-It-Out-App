import 'package:cs1635_dish_it_out_app/view/widgets/saved_restaurant_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../model/static_restaurant_list.dart';

class SavedView extends StatefulWidget {
  const SavedView({Key? key}) : super(key: key);

  @override
  _MySavedState createState() => _MySavedState();
}

class _MySavedState extends State<SavedView> {

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
                    color: HexColor("B22222"),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: Container(
            child: _numLikedRestaurants > 0
                ? ListView.builder(
                    itemCount: _numLikedRestaurants,
                    itemBuilder: (context, index) {
                      return SavedRestaurantWidget(
                          restaurant:
                              StaticRestaurantList.likedRestaurants![index]);
                    })
                : Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Text(
                        'Nothing here yet. Swipe to save your likes!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 30,
                            color: HexColor("B22222"),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}

import 'package:cs1635_dish_it_out_app/view/widgets/saved_restaurant_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../model/static_variables.dart';

class SavedView extends StatefulWidget {
  const SavedView({Key? key}) : super(key: key);

  @override
  _MySavedState createState() => _MySavedState();
}

class _MySavedState extends State<SavedView> {
  var _numLikedRestaurants = StaticVariables.likedRestaurants!.length;

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
                          restaurant: StaticVariables.likedRestaurants![index]);
                    })
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/empty.png',
                        height: 400,
                        width: 400,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        child: Text(
                          'Hungry for something new? \n  Swipe to fill your plate!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 22,
                            color: HexColor("B22222"),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

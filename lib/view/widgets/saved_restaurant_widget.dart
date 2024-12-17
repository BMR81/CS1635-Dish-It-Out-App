import 'package:cs1635_dish_it_out_app/model/restaurant_model.dart';
import 'package:flutter/material.dart';

import '../../model/static_variables.dart';
import '../details_view.dart';
import '../saved_view.dart';

class SavedRestaurantWidget extends StatefulWidget {
  final restaurant_model restaurant;

  const SavedRestaurantWidget({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  _MySavedRestaurantState createState() => _MySavedRestaurantState();
}

class _MySavedRestaurantState extends State<SavedRestaurantWidget> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black,
              )),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                    widget.restaurant.image.toString()),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.restaurant.name.toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          icon: Icon(Icons.close),
                          iconSize: 30,
                          onPressed: () {
                            setState(() {
                              StaticVariables.likedRestaurants
                                  ?.remove(widget.restaurant);

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SavedView()),
                              );
                            });
                          },
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        icon: Icon(Icons.info_outline),
                        iconSize: 35,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsView(
                                        restaurant: widget.restaurant,
                                      )));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

import 'package:cs1635_dish_it_out_app/model/restaurant_model.dart';
import 'package:flutter/material.dart';

import '../details_view.dart';

class RestaurantCardWidget extends StatefulWidget {
  final restaurant_model restaurant;

  const RestaurantCardWidget({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  _MyRestaurantCardState createState() => _MyRestaurantCardState();
}

class _MyRestaurantCardState extends State<RestaurantCardWidget> {
  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 30),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.asset(widget.restaurant.image.toString()),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.restaurant.name.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 20,
                      fontWeight: FontWeight.bold, // Keep bold here
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Recommended for you:",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Image.asset(
                      'assets/images/${widget.restaurant.dish.toString()}.png',
                      alignment: Alignment.bottomRight,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    icon: Icon(Icons.info_outline),
                    iconSize: 40,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsView(
                            restaurant: widget.restaurant,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    ),
  );
}

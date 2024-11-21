import 'package:cs1635_dish_it_out_app/model/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
        color: HexColor("#FFF4EB"),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(widget.restaurant.image.toString()),
          ),
          SizedBox(height: 10),
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
                      fontWeight: FontWeight.bold,
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
                    child: Container(
                      height: 40, // Slightly larger than the image
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey, // Border color
                          width: 1.0, // Border thickness
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/${widget.restaurant.dish.toString()}.png',
                          alignment: Alignment.bottomRight,
                          height: 30,
                          width: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    icon: Icon(Icons.info_outline),
                    iconSize: 30,
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
              ),
              SizedBox(height: 10),
            ],
          ),
        ],
      ),
    ),
  );
}


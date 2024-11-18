import 'package:cs1635_dish_it_out_app/model/restaurant_model.dart';
import 'package:flutter/material.dart';

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
              )),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image(
                    image: NetworkImage(widget.restaurant.image.toString())),
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
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
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
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 12),
                        ),
                      ),
                    ),
                    Row(
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

                        SizedBox(width: 200,),

                          IconButton(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            icon: Icon(Icons.info_outline),
                            iconSize: 40,
                            onPressed: () {

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

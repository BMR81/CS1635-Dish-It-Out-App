import 'package:cs1635_dish_it_out_app/model/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DetailsView extends StatefulWidget {
  final restaurant_model restaurant;

  const DetailsView({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  _MyDetailsState createState() => _MyDetailsState();
}

class _MyDetailsState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 50,
              padding: EdgeInsets.only(top: 60),
              onPressed: () {
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsView(
                              restaurant: widget.restaurant,
                            )));
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(widget.restaurant.image.toString())),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    widget.restaurant.name.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  iconSize: 40,
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 5),
                  child: Text(
                    widget.restaurant.rating.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(fontFamily: 'Quicksand', fontSize: 18),
                  ),
                ),
                Stack(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star_border,
                      color: Colors.black,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    "(${widget.restaurant.numReviews.toString()})",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 5),
                  child: Icon(Icons.location_on),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    widget.restaurant.location.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 15),
              child: Text(
                widget.restaurant.hours.toString(),
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 15),
              child: Text(
                "Dishes you might like:",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/${widget.restaurant.dish.toString()}.png',
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    widget.restaurant.dish.toString().toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                "Reviews (coming soon)",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 25,
                    color: HexColor("00abff"),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

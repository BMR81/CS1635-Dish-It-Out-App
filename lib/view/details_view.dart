import 'package:cs1635_dish_it_out_app/model/restaurant_model.dart';
import 'package:cs1635_dish_it_out_app/model/static_variables.dart';
import 'package:cs1635_dish_it_out_app/view/widgets/review_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icon_decoration/icon_decoration.dart';

import '../model/review_model.dart';

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
  Color _firstStar = HexColor("#B22222");
  Color _secondStar = Colors.white;
  Color _thirdStar = Colors.white;
  Color _fourthStar = Colors.white;
  Color _fifthStar = Colors.white;

  final _formKey = GlobalKey<FormState>();
  final _bodycontroller = TextEditingController();

  var _newReview = review_model();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 50,
                color: HexColor("#B22222"),
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
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  widget.restaurant.name.toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: HexColor("#B22222"),
                      fontFamily: 'Quicksand',
                      fontSize: 25,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 5),
                    child: Text(
                      widget.restaurant.rating.toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(fontFamily: 'Quicksand', fontSize: 18, fontWeight: FontWeight.w600,),
                    ),
                  ),
                  Stack(
                    children: [
                      Icon(
                        Icons.star,
                        color: HexColor("#B22222"),
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
                        //fontWeight: FontWeight.w600,
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
                      color: HexColor("#B22222"),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0, left: 0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: HexColor("#B22222"),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Text(
                          widget.restaurant.dish.toString().toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Reviews",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 25,
                          color: HexColor("B22222"),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: InkWell(
                      child: Text(
                        '+ Add Review',
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 16,
                          color: HexColor("#FF6347"),
                        ),
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                  builder: (context, StateSetter setState) {
                                return AlertDialog(
                                  backgroundColor: HexColor("fff4eb"),
                                  title: Text(
                                      'Review for ${widget.restaurant.name.toString()}',
                                      style: TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold,
                                      ),
                                  ),
                                  content: Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Select rating: ',
                                              style: TextStyle(
                                                fontFamily: 'Quicksand',
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3),
                                              child: GestureDetector(
                                                child: DecoratedIcon(
                                                  icon: Icon(
                                                    Icons.star,
                                                    color: _firstStar,
                                                  ),
                                                  decoration: IconDecoration(
                                                    border: IconBorder(),
                                                  ),
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    _firstStar = HexColor("#B22222");
                                                    _secondStar = Colors.white;
                                                    _thirdStar = Colors.white;
                                                    _fourthStar = Colors.white;
                                                    _fifthStar = Colors.white;

                                                    _newReview.rating = 1;
                                                  });
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3),
                                              child: GestureDetector(
                                                child: DecoratedIcon(
                                                  icon: Icon(
                                                    Icons.star,
                                                    color: _secondStar,
                                                  ),
                                                  decoration: IconDecoration(
                                                    border: IconBorder(),
                                                  ),
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    _firstStar = HexColor("#B22222");
                                                    _secondStar = HexColor("#B22222");
                                                    _thirdStar = Colors.white;
                                                    _fourthStar = Colors.white;
                                                    _fifthStar = Colors.white;

                                                    _newReview.rating = 2;
                                                  });
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3),
                                              child: GestureDetector(
                                                child: DecoratedIcon(
                                                  icon: Icon(
                                                    Icons.star,
                                                    color: _thirdStar,
                                                  ),
                                                  decoration: IconDecoration(
                                                    border: IconBorder(),
                                                  ),
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    _firstStar = HexColor("#B22222");
                                                    _secondStar = HexColor("#B22222");
                                                    _thirdStar = HexColor("#B22222");
                                                    _fourthStar = Colors.white;
                                                    _fifthStar = Colors.white;

                                                    _newReview.rating = 3;
                                                  });
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3),
                                              child: GestureDetector(
                                                child: DecoratedIcon(
                                                  icon: Icon(
                                                    Icons.star,
                                                    color: _fourthStar,
                                                  ),
                                                  decoration: IconDecoration(
                                                    border: IconBorder(),
                                                  ),
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    _firstStar = HexColor("#B22222");
                                                    _secondStar = HexColor("#B22222");
                                                    _thirdStar = HexColor("#B22222");
                                                    _fourthStar = HexColor("#B22222");
                                                    _fifthStar = Colors.white;

                                                    _newReview.rating = 4;
                                                  });
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3),
                                              child: GestureDetector(
                                                child: DecoratedIcon(
                                                  icon: Icon(
                                                    Icons.star,
                                                    color: _fifthStar,
                                                  ),
                                                  decoration: IconDecoration(
                                                    border: IconBorder(),
                                                  ),
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    _firstStar = HexColor("#B22222");
                                                    _secondStar = HexColor("#B22222");
                                                    _thirdStar = HexColor("#B22222");
                                                    _fourthStar = HexColor("#B22222");
                                                    _fifthStar = HexColor("#B22222");

                                                    _newReview.rating = 5;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 25),
                                          child: Form(
                                            key: _formKey,
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller: _bodycontroller,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                    labelText: 'Review Body',
                                                    hintText:
                                                        'Enter body of review',
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                  ),
                                                  onChanged:
                                                      (String enteredBody) {
                                                    _newReview.body =
                                                        enteredBody;
                                                  },
                                                  validator: (enteredBody) {
                                                    if (enteredBody == null ||
                                                        enteredBody.isEmpty) {
                                                      return 'Please enter a review';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 20),
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          HexColor("#B22222"),
                                                      foregroundColor: Colors
                                                          .white, // Text color
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      elevation:
                                                          5,
                                                    ).copyWith(
                                                      backgroundColor:
                                                          WidgetStateProperty
                                                              .resolveWith<
                                                                  Color>(
                                                        (Set<WidgetState>
                                                            states) {
                                                          if (states.contains(
                                                              WidgetState
                                                                  .pressed)) {
                                                            return HexColor(
                                                                "#FF6347");
                                                          }
                                                          return HexColor(
                                                              "#B22222");
                                                        },
                                                      ),
                                                    ),
                                                    onPressed: () async {
                                                      if (_formKey.currentState!
                                                          .validate()) {
                                                        _newReview.restaurant =
                                                            widget.restaurant;
                                                        if (_newReview.rating ==
                                                            null) {
                                                          _newReview.rating = 1;
                                                        }

                                                        widget
                                                            .restaurant.reviews
                                                            ?.add(_newReview);
                                                        widget.restaurant
                                                            .numReviews = (widget
                                                                .restaurant
                                                                .numReviews! +
                                                            1);

                                                        StaticVariables.reviews
                                                            ?.add(_newReview);

                                                        Navigator.of(context)
                                                            .pop(false);
                                                      }
                                                    },
                                                    child: const Text(
                                                      'Submit Review',
                                                      style: TextStyle(
                                                        fontFamily: 'Quicksand',
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                            });
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  child: widget.restaurant.reviews != null
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.restaurant.reviews!.length,
                          itemBuilder: (context, index) {
                            return ReviewWidget(
                                review: widget.restaurant.reviews![index]);
                          })
                      : SizedBox(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: HexColor("#fff4eb"),
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'chill_guy',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' tried: ',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Text(
                            widget.restaurant.dish!.toUpperCase().toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                              'assets/images/${widget.restaurant.dish.toString()}.png',
                              height: 100,
                              width: 100,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              width: 230,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      children: [
                                        Stack(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: HexColor("#B22222"),
                                            ),
                                            Icon(
                                              Icons.star_border,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                        Stack(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: HexColor("#B22222"),
                                            ),
                                            Icon(
                                              Icons.star_border,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                        Stack(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: HexColor("#B22222"),
                                            ),
                                            Icon(
                                              Icons.star_border,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                        Stack(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: HexColor("#B22222"),
                                            ),
                                            Icon(
                                              Icons.star_border,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                        Stack(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: HexColor("#B22222"),
                                            ),
                                            Icon(
                                              Icons.star_border,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '\"I absolutely loved the ${widget.restaurant.dish.toString()}! I will definitely be returning!\"',
                                    softWrap: true,
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: HexColor("#fff4eb"),
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'chill_individual',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' tried: ',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            widget.restaurant.dish!.toUpperCase().toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                              'assets/images/${widget.restaurant.dish.toString()}.png',
                              height: 100,
                              width: 100,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              width: 230,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      children: [
                                        Stack(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: HexColor("#B22222"),
                                            ),
                                            Icon(
                                              Icons.star_border,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                        Stack(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: HexColor("#B22222"),
                                            ),
                                            Icon(
                                              Icons.star_border,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                        Stack(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: HexColor("#B22222"),
                                            ),
                                            Icon(
                                              Icons.star_border,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '\"Honestly, very mid ${widget.restaurant.dish.toString()}. Nothing special.\"',
                                    softWrap: true,
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: HexColor("#fff4eb"),
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'chill_girl',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' tried: ',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            widget.restaurant.dish!.toUpperCase().toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                              'assets/images/${widget.restaurant.dish.toString()}.png',
                              height: 100,
                              width: 100,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              width: 230,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      children: [
                                        Stack(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: HexColor("#B22222"),
                                            ),
                                            Icon(
                                              Icons.star_border,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '\"I really did not like the ${widget.restaurant.dish.toString()}...\"',
                                    softWrap: true,
                                    style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

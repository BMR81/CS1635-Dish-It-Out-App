import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../model/review_model.dart';
import '../details_view.dart';

class ReviewWidget extends StatefulWidget {
  final review_model review;

  const ReviewWidget({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  _MyReviewState createState() => _MyReviewState();
}

class _MyReviewState extends State<ReviewWidget> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
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
                          text: 'You',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' visited: ',
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
                    widget.review.restaurant!.name!.toString(),
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    icon: Icon(Icons.info_outline),
                    iconSize: 30,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsView(
                                    restaurant: widget.review.restaurant!,
                                  )));
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: 230,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            child: _buildStarsRow(widget.review.rating!),
                          ),
                          Text(
                            '${widget.review.restaurant!.dish!.toUpperCase().toString()}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '\"${widget.review.body.toString()}\"',
                            softWrap: true,
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
}

Row _buildStarsRow(int numStars) {
  if (numStars == 1) {
    return Row(
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
    );
  } else if (numStars == 2) {
    return Row(
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
      ],
    );
  } else if (numStars == 3) {
    return Row(
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
    );
  } else if (numStars == 4) {
    return Row(
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
      ],
    );
  } else if (numStars == 5) {
    return Row(
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
    );
  }

  return Row(
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
  );
}

import 'package:cs1635_dish_it_out_app/model/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
  _SavedRestaurantWidgetState createState() => _SavedRestaurantWidgetState();
}

class _SavedRestaurantWidgetState extends State<SavedRestaurantWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Container(
        decoration: _containerDecoration(),
        child: Row(
          children: [
            _buildImageSection(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleRow(),
                  _buildInfoButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Container Decoration
  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      color: HexColor("FFF4EB"),
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: Colors.black),
    );
  }

  // Left-side Image Section
  Widget _buildImageSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.asset(
            widget.restaurant.image.toString(),
            height: 85,
            width: 85,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  // Title and Close Button Row
  Widget _buildTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            widget.restaurant.name.toString(),
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close, size: 20),
          onPressed: _removeRestaurant,
        ),
      ],
    );
  }

  // Info Button Bottom Right
  Widget _buildInfoButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: IconButton(
        icon: const Icon(Icons.info_outline, size: 25),
        onPressed: _navigateToDetails,
      ),
    );
  }

  // Remove Restaurant Handler
  void _removeRestaurant() {
    setState(() {
      StaticVariables.likedRestaurants?.remove(widget.restaurant);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SavedView()),
      );
    });
  }

  // Navigate to Details View Handler
  void _navigateToDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsView(restaurant: widget.restaurant),
      ),
    );
  }
}

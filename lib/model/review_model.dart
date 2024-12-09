import 'package:cs1635_dish_it_out_app/model/restaurant_model.dart';

class review_model {
  int? rating;
  String? body;
  restaurant_model? restaurant;

  review_model(
      {this.rating,
        this.body,
        this.restaurant});

}

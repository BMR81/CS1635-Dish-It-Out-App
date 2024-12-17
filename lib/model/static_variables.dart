import 'package:cs1635_dish_it_out_app/model/restaurant_model.dart';
import 'package:cs1635_dish_it_out_app/model/review_model.dart';
import 'package:cs1635_dish_it_out_app/model/user_model.dart';

class StaticVariables {
  static user_model? user;
  static List<restaurant_model>? restaurants;
  static List<restaurant_model>? likedRestaurants = <restaurant_model>[];
  static List<review_model>? reviews = <review_model>[];
}

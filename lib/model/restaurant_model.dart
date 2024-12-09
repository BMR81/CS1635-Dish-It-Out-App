import 'package:cs1635_dish_it_out_app/model/review_model.dart';

class restaurant_model {
  int? id;
  String? name;
  String? image;
  String? location;
  String? hours;
  List<String>? preferences;
  double? rating;
  int? numReviews;
  List<review_model>? reviews;
  String? dish;

  restaurant_model(
      {this.id,
      this.name,
      this.image,
      this.location,
      this.hours,
      this.preferences,
      this.rating,
      this.numReviews,
      this.reviews,
      this.dish});

  restaurant_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    location = json['location'];
    hours = json['hours'];
    rating = json['rating'];
    numReviews = json['number_of_reviews'];
    dish = json['dish'];
  }
}

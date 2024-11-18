import 'dart:convert';

import 'package:cs1635_dish_it_out_app/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../model/restaurant_model.dart';

class RestaurantViewModel {

  Future<List<restaurant_model>> fetchRestaurants() async{
    final response = await rootBundle.loadString('assets/datasets/restaurants.json');
    final json = jsonDecode(response) as List<dynamic>;

    final restaurantList = json.map((e) => restaurant_model.fromJson(e)).toList();
    return restaurantList;
  }


  Future<List<restaurant_model>> getMatches(user_model currUser) async {
    List<restaurant_model> restaurants = await fetchRestaurants();
    List<restaurant_model> matchedRestaurants = <restaurant_model>[];

    for(var restaurant in restaurants) {
      if (restaurant.dish.toString() == currUser.firstDish.toString() || restaurant.dish.toString() == currUser.secondDish.toString() || restaurant.dish.toString() == currUser.thirdDish.toString()) {
        matchedRestaurants.add(restaurant);
      }
    }
    return matchedRestaurants;

  }

}
import 'dart:convert';

import 'package:cs1635_dish_it_out_app/model/user_model.dart';
import 'package:flutter/services.dart';

class UserViewModel {
  user_model currentUser = user_model();

  Future<List<user_model>> fetchUsers() async {
    final response = await rootBundle.loadString('assets/datasets/users.json');
    final json = jsonDecode(response) as List<dynamic>;

    final userList = json.map((e) => user_model.fromJson(e)).toList();
    return userList;
  }

  Future<bool> validateUser(String username, String password) async {
    List<user_model> users = await fetchUsers();

    for (var user in users) {
      if (username == user.username && password == user.password) {
        currentUser = user;
        print(currentUser.username.toString());
        return true;
      }
    }
    return false;
  }

  user_model getCurrentUser() {
    print(currentUser.username.toString());
    return currentUser;
  }
}

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
        return true;
      }
    }
    return false;
  }

  user_model getCurrentUser() {
    return currentUser;
  }

  Future<bool> validateNewUsername(String username) async {
    List<user_model> users = await fetchUsers();

    for (var user in users) {
      if (username == user.username) {
        return false;
      }
    }
    return true;
  }

  Future<bool> validateNewEmail(String email) async {
    List<user_model> users = await fetchUsers();

    for (var user in users) {
      if (email == user.email) {
        return false;
      }
    }
    return true;
  }
}

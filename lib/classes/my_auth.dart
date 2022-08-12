import 'package:firebase_database/firebase_database.dart';
import 'package:pdp_tcg/classes/user.dart';
import 'package:flutter/material.dart';

class MyAuth {
  static bool check(String username, String password, String passwordConfirm) {
    // To do
    return false;
  }

  static String userIdGenerator() {
    // To do
    return '';
  }

  static void signUpUser(
      String username, String password, String passwordConfirm) {
    // Check conditions
    // if (checkPassword()) return;

    // Generate User ID
    final userId = userIdGenerator();
    if (userId == '') {
      debugPrint('userId is null');
      return;
    }

    // Push User to Database
    final ref = FirebaseDatabase.instance.ref();
    User user = User('P1', username, password); // userId
    ref.child('User').child('P1').set(user.toJson());
  }

  static User signInUser(String username, String password) {
    // Check conditions
    // Get User from Database
    // Compare password
    User user = User('ID', username, password);
    return user;
  }
}

import 'package:firebase_database/firebase_database.dart';
import 'package:pdp_tcg/classes/user.dart';
import 'package:flutter/material.dart';
import 'package:pdp_tcg/widgets/build_username.dart';
import 'package:pdp_tcg/pages/sign_up_page.dart';
import 'package:pdp_tcg/pages/sign_in_page.dart';

class MyAuth {
  static void signUpUser(
      String username, String password, String passwordConfirm) {
    // Check conditions
    if (username.isEmpty) {
      userInvalid = true;
    } else {
      userInvalid = false;
    }
    if (password.isEmpty || password.length < 8) {
      passInvalid = true;
    } else {
      passInvalid = false;
    }
    if (passwordConfirm.isEmpty || passwordConfirm != password) {
      passCFInvalid = true;
    } else {
      passCFInvalid = false;
    }

    // Push User to Database
    final ref = FirebaseDatabase.instance.ref();
    User user = User(username, password); // userId
    ref.child('User').child(username).set(user.toJson());
  }

  static Future<User> signInUser(String username, String password) async {
    // Check conditions
    if (username.isEmpty) {
      userInvalid = true;
    } else {
      userInvalid = false;
    }
    if (password.isEmpty || password.length < 8) {
      passwordInvalid1 = true;
    } else {
      passwordInvalid1 = false;
    }

    // Get User from Database
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('User').child(username).get();
    if (snapshot.exists) {
      Map map = snapshot.value as dynamic;
      if (password == map['password']) {
        passwordInvalid1 = false;
        passwordInvalid2 = false;
      } else {
        passwordInvalid1 = true;
      }
    } else {
      userInvalid = true;
    }
    User user = User(username, password);
    return Future.value(user);
  }
}

import 'package:firebase_database/firebase_database.dart';
import 'package:pdp_tcg/classes/user.dart';
import 'package:flutter/material.dart';
import 'package:pdp_tcg/widgets/build_username.dart';
import 'package:pdp_tcg/pages/sign_up_page.dart';
import 'package:pdp_tcg/pages/sign_in_page.dart';

int count =0;
class MyAuth {
  static bool check(String username, String password, String passwordConfirm) {
    // To do
    return false;
  }

  

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
    // if (checkPassword()) return;
    // if (!userInvalid && !passInvalid && !passCFInvalid) {
    //   Navigator.push(context,
    //     MaterialPageRoute(
    //       builder: (context) {
    //         return const SignInPage();
    //       },
    //     ),
    //   );
    // }


    // Generate User ID
    

    // Push User to Database
    final ref = FirebaseDatabase.instance.ref();
    User user = User( username, password); // userId
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
      passInvalid1 = true;
    } else {
      passInvalid1 = false;
    }
    
    // Get User from Database

final ref = FirebaseDatabase.instance.ref();
final snapshot = await ref.child('User').child(username).get();
if (snapshot.exists) {
    print(snapshot.value);
} else {
    print('No data available.');
}

    // Compare password

    User user = User(username, password);
    return user;
  }
}

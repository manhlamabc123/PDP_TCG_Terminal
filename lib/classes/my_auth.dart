import 'package:firebase_database/firebase_database.dart';
import 'package:pdp_tcg/classes/user.dart';
import 'package:pdp_tcg/widgets/build_username.dart';
import 'package:pdp_tcg/pages/sign_up_page.dart';
import 'package:pdp_tcg/pages/sign_in_page.dart';

class MyAuth {
  static void signUpUser(
      String username, String password, String passwordConfirm) {
    // Check conditions
    if (username == '') {
      userInvalid = true;
    } else {
      userInvalid = false;
    }
    if (password == '' || password.length < 8) {
      passInvalid = true;
    } else {
      passInvalid = false;
    }
    if (passwordConfirm == '' || passwordConfirm != password) {
      passCFInvalid = true;
    } else {
      passCFInvalid = false;
    }

    // Push User to Database
    if (userInvalid == false &&
        passInvalid == false &&
        passCFInvalid == false) {
      final ref = FirebaseDatabase.instance.ref();
      User user = User(username, password); // userId
      ref.child('User').child(username).set(user.toJson());
    }
  }

  static Future<User?> signInUser(String username, String password) async {
    // Check conditions
    if (username == '') {
      userInvalid = true;
    } else {
      userInvalid = false;
    }
    if (password == '' || password.length < 8) {
      passwordInvalid1 = true;
    } else {
      passwordInvalid1 = false;
    }

    // Get User from Database
    if (userInvalid == false && passwordInvalid1 == false) {
      final ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child('User').child(username).get();
      if (snapshot.exists) {
        Map map = snapshot.value as dynamic;
        if (password == map['password']) {
          passwordInvalid1 = false;
          passwordInvalid2 = false;
          User user = User(map['username'], map['password']);
          return Future.value(user);
        } else {
          passwordInvalid1 = true;
        }
      } else {
        userInvalid = true;
      }
    }
    return Future.value(null);
  }
}

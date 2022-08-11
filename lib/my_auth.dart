import 'package:firebase_database/firebase_database.dart';
import 'package:pdp_tcg/user.dart';

class MyAuth {
  MyAuth.signUpUser(String username, String password) {
    final ref = FirebaseDatabase.instance.ref();
    User user = User('P1', username, password);
    ref.child('User').child('P1').set(user.toJson());
  }
}

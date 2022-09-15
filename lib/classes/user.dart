import 'package:pdp_tcg/classes/achievement.dart';

class User {
  String username;
  String password;
  List<Achievement>? achievements;

  User(this.username, this.password, this.achievements);

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'achievements': achievements,
      };
}

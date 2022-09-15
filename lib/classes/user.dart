import 'package:pdp_tcg/classes/achievement.dart';

class User {
  String username;
  String password;
  int? rankPoint;
  int? gachaPoint;
  List<Achievement>? achievements;

  User(this.username, this.password, this.achievements, this.rankPoint, this.gachaPoint);

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'achievements': achievements,
        'rankPoint': rankPoint,
        'gachaPoint': gachaPoint
      };
}

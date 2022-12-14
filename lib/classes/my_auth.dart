import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:pdp_tcg/classes/achievement.dart';
import 'package:pdp_tcg/classes/post.dart';
import 'package:pdp_tcg/classes/record.dart';
import 'package:pdp_tcg/classes/toast.dart';
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
      User user = User(username, password, null, 0, 0); // userId
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
          List<Achievement>? achievements;
          if (map['achievements'] != null) {
            Map map2 = Map<String, dynamic>.from(map['achievements']);
            achievements = map2.entries
                .map((entry) => Achievement(entry.value['name'],
                    entry.value['date'], entry.value['top']))
                .toList();
          }
          User user = User(map['username'], map['password'], achievements,
              map['rankPoint'], map['gachaPoint']);
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

  static void submitPost(String? title, String? description) {
    final ref = FirebaseDatabase.instance.ref();
    DateTime now = DateTime.now();
    Post post = Post(
      title,
      description,
      userCurrent!.username,
      dateCreate(now.day, now.month, now.year),
    );
    String id = "${userCurrent!.username}-${now.toString().replaceAll('.', '-')}";
    ref
        .child('Post')
        .child(id)
        .set(post.toJson())
        .then((value) => showToast("Posted"));
  }

  static void submitRecord(
    String status,
    String format,
    String you,
    String opponent,
    String yourDeck,
    String opponentDeck,
    String yourScore,
    String opponentScore,
  ) {
    DateTime now = DateTime.now();
    final ref = FirebaseDatabase.instance.ref();
    Record record = Record(
      status,
      format,
      you,
      opponent,
      yourDeck,
      yourScore,
      opponentDeck,
      opponentScore,
      dateCreate(now.day, now.month, now.year),
    );
    userMatchHistory.add(record);
    userMatchHistory.sort((a, b) {
      DateTime dateTimeA = DateTime.parse(a.date);
      DateTime dateTimeB = DateTime.parse(b.date);
      return dateTimeB.compareTo(dateTimeA);
    });
    String rankPointGet = int.parse(yourScore) < int.parse(opponentScore)
        ? "+1 Gacha Point"
        : "+3 Gacha Point, +1 Rank Point";
    String toast = status == "Unofficial" ? "+1 Gacha Point" : rankPointGet;
    String id = "$format-$you-$opponent-${now.toString().replaceAll('.', '-')}";
    ref
        .child('Record')
        .child(id)
        .set(record.toJson())
        .then((value) => showToast(toast));

    int yourRankPointPlus =
        int.parse(yourScore) < int.parse(opponentScore) ? 0 : 1;
    int yourGachaPointPlus =
        int.parse(yourScore) < int.parse(opponentScore) ? 1 : 3;
    userCurrent!.rankPoint = userCurrent!.rankPoint! + yourRankPointPlus;
    userCurrent!.gachaPoint = userCurrent!.gachaPoint! + yourGachaPointPlus;
    ref.child('User').child(userCurrent!.username).update({
      "rankPoint": userCurrent!.rankPoint,
      "gachaPoint": userCurrent!.gachaPoint
    });

    final snapshot = ref.child('User').child(opponent).get();
    snapshot.then((value) {
      if (value.exists) {
        int oppRankPointPlus =
            int.parse(yourScore) < int.parse(opponentScore) ? 1 : 0;
        int oppGachaPointPlus =
            int.parse(yourScore) < int.parse(opponentScore) ? 3 : 1;
        Map map = value.value as dynamic;
        int oppNewRankPoint = map['rankPoint'] + oppRankPointPlus;
        int oppNewGachaPoint = map['gachaPoint'] + oppGachaPointPlus;
        ref.child('User').child(opponent).update(
            {"rankPoint": oppNewRankPoint, "gachaPoint": oppNewGachaPoint});
      }
    });
  }

  static String dateCreate(int day, int month, int year) {
    String date = "";
    if (month <= 9) {
      date = "$year-0$month-$day";
    } else {
      date = "$year-$month-$day";
    }
    return date;
  }

  static bool checkSubmitInput(String? opponent, String? yourDeck,
      String? opponentDeck, String? yourScore, String? opponentScore) {
    if (opponent == null ||
        yourDeck == null ||
        opponentDeck == null ||
        yourScore == null ||
        opponentScore == null) return false;
    return true;
  }

  static Future<List<Record>> getUserMatchHistory() async {
    List<Record> records = [];
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('Record').get();
    if (snapshot.exists) {
      Map map = snapshot.value as dynamic;
      map.forEach((key, value) {
        if (key.toString().contains(userCurrent!.username)) {
          Record record = Record(
              value['status'],
              value['format'],
              value['you'],
              value['opponent'],
              value['yourDeck'],
              value['yourScore'],
              value['opponentDeck'],
              value['opponentScore'],
              value['date']);
          records.add(record);
        }
      });
    } else {
      debugPrint('Nothing');
    }
    records.sort((a, b) {
      DateTime dateTimeA = DateTime.parse(a.date);
      DateTime dateTimeB = DateTime.parse(b.date);
      return dateTimeB.compareTo(dateTimeA);
    });
    return Future.value(records);
  }
}

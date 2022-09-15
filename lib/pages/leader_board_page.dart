import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pdp_tcg/classes/user.dart';
import 'package:pdp_tcg/constants.dart';
import 'package:pdp_tcg/pages/user_profile/appbar_widget.dart';

List<User> userRanking = [];

class LeaderBoardPage extends StatefulWidget {
  const LeaderBoardPage({super.key});

  @override
  State<LeaderBoardPage> createState() => _LeaderBoardPageState();
}

class _LeaderBoardPageState extends State<LeaderBoardPage> {
  @override
  void initState() {
    super.initState();
    getUserRanking().then((value) {
      setState(() {
        userRanking = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Leader Broad"),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(34),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: userRanking.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 5, right: 10, left: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor2,
                              borderRadius: BorderRadius.circular(34),
                              border:
                                  Border.all(color: kPrimaryColor, width: 4),
                            ),
                            child: ListTile(
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${index + 1}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: getTextFont(index + 1),
                                      color: getTextColor(index + 1),
                                    ),
                                  ),
                                ],
                              ),
                              title: Text(userRanking[index].username),
                              subtitle:
                                  Text(userRanking[index].rankPoint.toString()),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<User>> getUserRanking() async {
    List<User> users = [];
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('User').get();
    if (snapshot.exists) {
      Map map = snapshot.value as dynamic;
      map.forEach((key, value) {
        User user = User(
          value['username'],
          value['password'],
          null,
          value['rankPoint'],
          value['gachaPoint'],
        );
        users.add(user);
        users.sort(((a, b) {
          return b.rankPoint!.compareTo(a.rankPoint!);
        }));
      });
    } else {
      debugPrint('Nothing');
    }
    return Future.value(users);
  }

  static double getTextFont(int index) {
    switch (index) {
      case 1:
        return 47;
      case 2:
        return 42;
      case 3:
        return 39;
      default:
        return 32;
    }
  }

  static Color getTextColor(int index) {
    switch (index) {
      case 1:
        return const Color(0xFFffd700);
      case 2:
        return const Color(0xFFc0c0c0);
      case 3:
        return const Color(0xFFAD8A56);
      default:
        return Colors.white;
    }
  }
}

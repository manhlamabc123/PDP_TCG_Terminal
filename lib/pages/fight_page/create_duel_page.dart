import 'package:flutter/material.dart';
import 'package:pdp_tcg/classes/my_auth.dart';
import 'package:pdp_tcg/classes/toast.dart';
import 'package:pdp_tcg/constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:pdp_tcg/pages/fight_page/fight_page.dart';
import 'package:pdp_tcg/pages/sign_in_page.dart';

class CreateDuelPage extends StatefulWidget {
  const CreateDuelPage({super.key});

  @override
  State<CreateDuelPage> createState() => _CreateDuelPageState();
}

class _CreateDuelPageState extends State<CreateDuelPage> {
  final vanguardFormat = ['Master Duel', 'Goat', 'Speed', 'Rush'];
  final status = ['Official', 'Unofficial'];
  List<String> userList = ['User 1', 'User 2'];
  String formatValue = 'Master Duel';
  String statusValue = 'Unofficial';
  String? userListValue;
  String? yourDeck;
  String? opponentDeck;
  String? yourScore;
  String? opponentScore;
  final textFieldHeight = 58.0;
  final textFieldWidth = 200.0;
  final scoreFieldHeight = 50.0;
  final scoreFieldWidth = 50.0;

  @override
  void initState() {
    super.initState();
    getUserList().then((value) {
      setState(() {
        userList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100, right: 130),
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
            child: const Text(
              'Create a record:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: kBackgroundColor1,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: kBackgroundColor1, width: 1),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Status: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: DropdownButton<String>(
                        value: statusValue,
                        items: status.map(buildMenuItem).toList(),
                        onChanged: (value) => setState(() {
                          statusValue = value!;
                        }),
                        dropdownColor: kBackgroundColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Format: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: DropdownButton<String>(
                        value: formatValue,
                        items: vanguardFormat.map(buildMenuItem).toList(),
                        onChanged: (value) => setState(() {
                          formatValue = value!;
                        }),
                        dropdownColor: kBackgroundColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Opponent: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: DropdownButton<String>(
                        value: userListValue,
                        items: userList.map(buildMenuItem).toList(),
                        onChanged: (value) => setState(() {
                          userListValue = value!;
                        }),
                        dropdownColor: kBackgroundColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Your Deck: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: textFieldWidth,
                      height: textFieldHeight,
                      child: TextField(
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        onChanged: (value) => setState(() {
                          yourDeck = value;
                        }),
                        onSubmitted: (value) => setState(() {
                          yourDeck = value;
                        }),
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                          hintText: 'Deck\'s name...',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Opponent Deck: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: textFieldWidth,
                      height: textFieldHeight,
                      child: TextField(
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        onChanged: (value) => setState(() {
                          opponentDeck = value;
                        }),
                        onSubmitted: (value) => setState(() {
                          opponentDeck = value;
                        }),
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                          hintText: 'Deck\'s name...',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Score: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'You: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: scoreFieldWidth,
                      height: scoreFieldHeight,
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) => setState(() {
                          yourScore = value;
                        }),
                        onSubmitted: (value) => setState(() {
                          yourScore = value;
                        }),
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                          hintText: '0',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      '-',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Opp: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: scoreFieldWidth,
                      height: scoreFieldHeight,
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) => setState(() {
                          opponentScore = value;
                        }),
                        onSubmitted: (value) => setState(() {
                          opponentScore = value;
                        }),
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                          hintText: '0',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  bool check = MyAuth.checkSubmitInput(userListValue, yourDeck,
                      opponentDeck, yourScore, opponentScore);
                  if (check) {
                    MyAuth.submitRecord(
                        statusValue,
                        formatValue,
                        userCurrent!.username,
                        userListValue!,
                        yourDeck!,
                        opponentDeck!,
                        yourScore!.toString(),
                        opponentScore!.toString());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const FightPage();
                        },
                      ),
                    );
                  } else {
                    showToast("All fields must be filled!!!");
                  }
                },
                child: const Text(
                  'Record',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      );

  Future<List<String>> getUserList() async {
    List<String> users = [];
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('User').get();
    if (snapshot.exists) {
      Map map = snapshot.value as dynamic;
      map.forEach((key, value) {
        users.add(value['username']);
      });
    } else {
      debugPrint('Nothing');
    }
    return Future.value(users);
  }
}

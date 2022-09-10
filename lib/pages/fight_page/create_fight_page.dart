import 'package:flutter/material.dart';
import 'package:pdp_tcg/constants.dart';
import 'package:firebase_database/firebase_database.dart';

class CreateFightPage extends StatefulWidget {
  const CreateFightPage({super.key});

  @override
  State<CreateFightPage> createState() => _CreateFightPageState();
}

class _CreateFightPageState extends State<CreateFightPage> {
  final vanguardFormat = ['Standard', 'V-Premium', 'Premium'];
  List<String> userList = ['User 1', 'User 2'];
  String formatValue = 'Standard';
  String? userListValue;
  String? yourDeck;
  final textFieldHeight = 58.0;
  final textFieldWidth = 200.0;
  final scoreFieldHeight = 40.0;
  final scoreFieldWidth = 40.0;

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
                          hintText: 'Deck\'s name',
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
                )
              ],
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
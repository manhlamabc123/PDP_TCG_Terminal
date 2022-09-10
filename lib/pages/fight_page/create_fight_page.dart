import 'package:flutter/material.dart';
import 'package:pdp_tcg/constants.dart';

class CreateFightPage extends StatefulWidget {
  const CreateFightPage({super.key});

  @override
  State<CreateFightPage> createState() => _CreateFightPageState();
}

class _CreateFightPageState extends State<CreateFightPage> {
  final vanguardFormat = ['Standard', 'V-Premium', 'Premium'];
  List<String> userList = ['User 1', 'User 2'];
  String formatValue = 'Standard';
  String userListValue = 'User 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100, right: 150),
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
            child: const Text(
              'Create a fight',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
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
                          this.formatValue = value!;
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
                          this.userListValue = value!;
                        }),
                        dropdownColor: kBackgroundColor,
                      ),
                    ),
                  ],
                ),
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
}

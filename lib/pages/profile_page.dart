import 'package:flutter/material.dart';
import 'package:pdp_tcg/pages/sign_in_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 350,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Username: ${userCurrent!.username}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

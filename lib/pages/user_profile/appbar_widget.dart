import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String title) {
  IconData icon = title == "Profile" ? Icons.settings : Icons.info;

  return AppBar(
    automaticallyImplyLeading: false,
    title: Text(
      title,
      style: const TextStyle(fontSize: 30),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
        icon: Icon(icon),
        onPressed: () {},
      ),
    ],
  );
}

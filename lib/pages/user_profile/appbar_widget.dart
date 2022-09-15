import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  const icon = Icons.settings;

  return AppBar(
    automaticallyImplyLeading: false,
    title: const Text(
      'Profile',
      style: TextStyle(fontSize: 30),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
        icon: const Icon(icon),
        onPressed: () {},
      ),
    ],
  );
}

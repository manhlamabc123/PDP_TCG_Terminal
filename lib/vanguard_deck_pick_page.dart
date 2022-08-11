import 'package:flutter/material.dart';

class VanguardDeckPickPage extends StatefulWidget {
  const VanguardDeckPickPage({super.key});

  @override
  State<VanguardDeckPickPage> createState() => _VanguardDeckPickPageState();
}

class _VanguardDeckPickPageState extends State<VanguardDeckPickPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Coming soon....',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

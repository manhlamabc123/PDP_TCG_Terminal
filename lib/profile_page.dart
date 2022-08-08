import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pdp_tcg/class.dart';

const int itemCount = 20;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            title: Text('Item ${(index + 1)}'),
            leading: const Icon(Icons.person),
            trailing: const Icon(Icons.select_all),
            onTap: () {
              createSomethingToServer(index);
            });
      },
    );
  }

  Future createSomethingToServer(int index) async {
    DatabaseReference storage =
        FirebaseDatabase.instance.ref().child('New').child('$index');
    final snapshot = await storage.get();
    if (snapshot.exists) {
      Test test = Test.fromJson(snapshot.value as dynamic);
      debugPrint('${test.name} ${test.age}');
    } else {
      debugPrint('No data available.');
    }
  }
}

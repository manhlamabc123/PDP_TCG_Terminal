import 'package:flutter/material.dart';
import 'package:pdp_tcg/pages/user_profile/appbar_widget.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "News"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ListTile(
                      title: Text(
                        "Post name $index",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      subtitle: Text("Description $index"),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

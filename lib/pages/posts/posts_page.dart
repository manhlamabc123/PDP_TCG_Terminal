import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pdp_tcg/classes/post.dart';
import 'package:pdp_tcg/pages/posts/add_button.dart';
import 'package:pdp_tcg/pages/user_profile/appbar_widget.dart';

List<Post> posts = [];

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    super.initState();
    getPosts().then((value) {
      setState(() {
        posts = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "News"),
      floatingActionButton: const AddTodoButton(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: posts.length,
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
                        posts[index].title!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      subtitle: Text(posts[index].description!),
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

  Future<List<Post>> getPosts() async {
    List<Post> posts = [];
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('Post').get();
    if (snapshot.exists) {
      Map map = snapshot.value as dynamic;
      map.forEach((key, value) {
        Post user = Post(
          value['title'],
          value['description'],
          value['username'],
          value['date'],
        );
        posts.add(user);
        posts.sort((a, b) {
          DateTime dateTimeA = DateTime.parse(a.date);
          DateTime dateTimeB = DateTime.parse(b.date);
          return dateTimeB.compareTo(dateTimeA);
        });
      });
    } else {
      debugPrint('Nothing');
    }
    return Future.value(posts);
  }
}

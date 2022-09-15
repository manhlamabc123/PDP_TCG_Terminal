import 'package:flutter/material.dart';
import 'package:pdp_tcg/pages/sign_in_page.dart';
import 'package:pdp_tcg/pages/user_profile/appbar_widget.dart';
import 'package:pdp_tcg/pages/user_profile/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

int currentIndex = 0;

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const imagePath =
        'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80';
    int winRate = 20;
    String favoriteDeck = 'Luard';
    final categories = ['Achievements', 'Match History', 'Collection'];

    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              ProfileWidget(imagePath: imagePath, onClicked: () async {}),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userCurrent!.username,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Winrate: ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "$winRate%",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Favorite Deck: ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        favoriteDeck,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(34),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 17.0, top: 20.0),
                          child: index == currentIndex
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      categories[index],
                                      style: const TextStyle(
                                        color: Colors.purple,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const CircleAvatar(
                                      radius: 2,
                                      backgroundColor: Colors.purple,
                                    )
                                  ],
                                )
                              : InkWell(
                                  child: Text(
                                    categories[index],
                                    style: TextStyle(
                                      color: Colors.grey.withOpacity(0.9),
                                      fontSize: 20,
                                    ),
                                  ),
                                  onTap: () => setState(() {
                                    currentIndex = index;
                                    debugPrint(currentIndex.toString());
                                  }),
                                ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

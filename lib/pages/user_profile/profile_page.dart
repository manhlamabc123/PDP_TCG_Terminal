import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pdp_tcg/classes/my_auth.dart';
import 'package:pdp_tcg/classes/record.dart';
import 'package:pdp_tcg/constants.dart';
import 'package:pdp_tcg/lists.dart';
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
  List<Record> userMatchHistory = [];

  @override
  void initState() {
    super.initState();
    MyAuth.getUserMatchHistory().then((value) {
      setState(() {
        userMatchHistory = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const imagePath =
        'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80';
    int winRate = 20;
    String favoriteDeck = 'Luard';
    final categories = ['Achievements', 'Match History', 'Collection'];
    final achievements = userCurrent!.achievements;

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
                                        color: kPrimaryColor,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const CircleAvatar(
                                      radius: 2,
                                      backgroundColor: kPrimaryColor,
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
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   itemCount: userCurrent!.achievements?.length,
                  //   itemBuilder: (context, index) {
                  //     return Padding(
                  //       padding:
                  //           const EdgeInsets.only(top: 5, right: 10, left: 10),
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           color: kPrimaryColor2,
                  //           borderRadius: BorderRadius.circular(12),
                  //           border: Border.all(color: kPrimaryColor, width: 4),
                  //         ),
                  //         child: ListTile(
                  //           leading: SizedBox(
                  //             height: double.infinity,
                  //             child: iconList[achievements![index].getTop()]),
                  //           title: Text(achievements[index].getName()),
                  //           subtitle: Text(achievements[index].getDate()),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: userMatchHistory.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 5, right: 10, left: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: kPrimaryColor2,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: kPrimaryColor, width: 4),
                          ),
                          child: ListTile(
                            title: Text(
                                "${userMatchHistory[index].you} VS ${userMatchHistory[index].opponent}"),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

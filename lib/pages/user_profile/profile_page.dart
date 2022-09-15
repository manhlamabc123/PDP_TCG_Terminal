import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
List<Icon> gameIcons = [
  const Icon(FontAwesomeIcons.n),
  const Icon(FontAwesomeIcons.v),
  const Icon(
    FontAwesomeIcons.v,
    color: Color(0xFFffd700),
  ),
  const Icon(FontAwesomeIcons.y),
  const Icon(
    FontAwesomeIcons.y,
    color: Color(0xFFffd700),
  ),
];

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const imagePath =
        'https://i0.wp.com/tleliteracy.com/wp-content/uploads/2017/02/default-avatar.png?ssl=1';
    String favoriteDeck = '';
    final categories = ['Achievements', 'Match History', 'Collection'];
    List<Widget> widgetList = [
      achievementWidget,
      matchHistoryWidget,
      collectionWidget
    ];

    return Scaffold(
      appBar: buildAppBar(context, "Profile"),
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
                        "${getWinRate(userMatchHistory).toStringAsFixed(2)}%",
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
                  Text(
                    'Rank: ${userCurrent!.rankPoint} - Gacha: ${userCurrent!.gachaPoint}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
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
                  Container(
                    child: widgetList[currentIndex],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget achievementWidget = userCurrent!.achievements != null
      ? Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: userCurrent!.achievements?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor2,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: kPrimaryColor, width: 4),
                  ),
                  child: ListTile(
                    leading: SizedBox(
                      height: double.infinity,
                      child:
                          iconList[userCurrent!.achievements![index].getTop()],
                    ),
                    title: Text(userCurrent!.achievements![index].getName()),
                    subtitle: Text(userCurrent!.achievements![index].getDate()),
                  ),
                ),
              );
            },
          ),
        )
      : Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 200),
          child: const Text(
            "Nothing yet...",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
        );

  Widget matchHistoryWidget = Expanded(
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: userMatchHistory.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryColor2,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: kPrimaryColor, width: 4),
            ),
            child: ListTile(
              leading: SizedBox(
                height: double.infinity,
                child: gameIcons[getGameIcon(
                  userMatchHistory[index].format,
                  userMatchHistory[index].status,
                )],
              ),
              title: Text(getMatchOpponent(userMatchHistory, index)),
              subtitle: Text(userMatchHistory[index].date),
            ),
          ),
        );
      },
    ),
  );

  Widget collectionWidget = Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.only(top: 200),
    child: const Text(
      "Coming Soon...",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 40,
      ),
    ),
  );

  static String getMatchOpponent(List<Record> userMatchHistory, int index) {
    if (userCurrent!.username == userMatchHistory[index].opponent) {
      return "VS: ${userMatchHistory[index].you}";
    } else {
      return "VS: ${userMatchHistory[index].opponent}";
    }
  }

  static double getWinRate(List<Record> userMatchHistory) {
    int total = userMatchHistory.length;
    int matchWin = 0;
    for (Record record in userMatchHistory) {
      double yourScore = double.parse(record.yourScore);
      double opponentScore = double.parse(record.opponentScore);
      if (userCurrent!.username == record.opponent) {
        if (yourScore < opponentScore) {
          matchWin += 1;
        }
      } else {
        if (yourScore > opponentScore) {
          matchWin += 1;
        }
      }
    }
    return ((matchWin / total) * 100);
  }

  static int getGameIcon(String format, String status) {
    switch (format) {
      case "Standard":
      case "V-Premium":
      case "Premium":
        return status == "Unofficial" ? 1 : 2;
      case "Master Duel":
      case "Goat":
      case "Speed":
      case "Rush":
        return status == "Unofficial" ? 3 : 4;
    }
    return 0;
  }
}

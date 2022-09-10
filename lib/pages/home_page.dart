import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdp_tcg/pages/fight_page/fight_page.dart';
import 'package:pdp_tcg/pages/leader_board_page.dart';
import 'package:pdp_tcg/pages/posts_page.dart';
import 'package:pdp_tcg/pages/profile_page.dart';
import 'package:pdp_tcg/pages/vanguard_deck_pick_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = const [
    PostsPage(),
    LeaderBoardPage(),
    VanguardDeckPickPage(),
    FightPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(FontAwesomeIcons.trophy), label: 'Ranking'),
          NavigationDestination(
              icon: Icon(FontAwesomeIcons.newspaper), label: 'Posts'),
          NavigationDestination(
              icon: Icon(FontAwesomeIcons.inbox), label: 'Support'),
          NavigationDestination(
              icon: Icon(FontAwesomeIcons.peopleArrowsLeftRight),
              label: 'Duel/Fight'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pdp_tcg/fight_page.dart';
import 'package:pdp_tcg/leader_board_page.dart';
import 'package:pdp_tcg/posts_page.dart';
import 'package:pdp_tcg/profile_page.dart';
import 'package:pdp_tcg/vanguard_deck_pick_page.dart';

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
              icon: Icon(FontAwesomeIcons.trophy), label: 'Leader Board'),
          NavigationDestination(
              icon: Icon(FontAwesomeIcons.newspaper), label: 'Posts'),
          NavigationDestination(
              icon: Icon(FontAwesomeIcons.inbox), label: 'Deck Picker'),
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

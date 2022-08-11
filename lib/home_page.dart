import 'package:flutter/material.dart';
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
    return Container();
  }
}
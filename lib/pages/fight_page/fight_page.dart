import 'package:flutter/material.dart';
import 'package:pdp_tcg/pages/fight_page/create_fight_page.dart';

class FightPage extends StatelessWidget {
  const FightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100, right: 150),
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
            child: const Text(
              'Create a fight',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 100, right: 180),
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: const Text(
              'Choose a game',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(left: 38),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Createfightpage();
                        },
                      ),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ink.image(
                        image: const NetworkImage(
                            'https://animeweb.xyz/wp-content/uploads/2022/07/cardfight-vanguard-willdress.jpg'),
                        height: 200,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Cardfight! Vanguard',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      const SizedBox(height: 6),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(right: 38),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Ink.image(
                        image: const NetworkImage(
                            'https://cdn-eu.anidb.net/images/main/270526.jpg'),
                        height: 200,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Yu-Gi-Oh!',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      const SizedBox(height: 6),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

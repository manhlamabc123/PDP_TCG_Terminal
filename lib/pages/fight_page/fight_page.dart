import 'package:flutter/material.dart';
import 'package:pdp_tcg/constants.dart';
import 'package:pdp_tcg/pages/fight_page/create_fight_page.dart';
import 'package:pdp_tcg/pages/fight_page/create_duel_page.dart';

class FightPage extends StatelessWidget {
  const FightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 100),
            child: const Text(
              'Record your Fight/Duel here!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: kBackgroundColor1, width: 4),
            ),
            child: Column(
              children: [
                const Text(
                  'Choose your game:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const CreateFightPage();
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Ink.image(
                              image: const AssetImage(
                                  "assets/cardfight-vanguard-willdress.jpg"),
                              height: 200,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'Cardfight! Vanguard',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const CreateDuelPage();
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Ink.image(
                              image: const AssetImage(
                                  "assets/cc67f22d58cc1c956f444718e2218420.jpg"),
                              height: 200,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              'Yu-Gi-Oh!',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

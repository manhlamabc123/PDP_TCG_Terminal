import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pdp_tcg/constants.dart';
import 'package:pdp_tcg/classes/vanguard_card.dart';

class VanguardDeckPickPage extends StatefulWidget {
  const VanguardDeckPickPage({super.key});

  @override
  State<VanguardDeckPickPage> createState() => _VanguardDeckPickPageState();
}

class _VanguardDeckPickPageState extends State<VanguardDeckPickPage> {
  List<VanguardCard> urlImages = [];
  int currentCards = 0;

  @override
  void initState() {
    super.initState();
    cardsToShow().then((value) {
      setState(() {
        urlImages = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          CarouselSlider.builder(
            itemCount: urlImages.length,
            itemBuilder: (context, index, realIndex) {
              final urlImage = urlImages[index];
              return buildImage(urlImage.image, index);
            },
            options: CarouselOptions(
              height: 500,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  currentCards = index;
                });
              },
            ),
          ),
          Text(
            urlImages.isEmpty ? 'Card Name' : urlImages[currentCards].name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        color: kBackgroundColor,
        child: Image.network(
          urlImage,
        ),
      );

  Future<List<VanguardCard>> cardsToShow() async {
    bool existed = false;
    List<VanguardCard> cards = [];
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('Vanguard Ace Card').get();
    if (snapshot.exists) {
      Map map = snapshot.value as dynamic;
      map.forEach((key, value) {
        VanguardCard vanguardCard = VanguardCard(
            value['critical'],
            value['effect'],
            value['grade'],
            value['image'],
            value['name'],
            value['nation'],
            value['number'],
            value['power'],
            value['race'],
            value['rarity'],
            value['regulation'],
            value['shield'],
            value['skill'],
            value['type']);
        for (VanguardCard vanguardCardInList in cards) {
          if (vanguardCardInList.name == vanguardCard.name) {
            existed = true;
            break;
          } else {
            existed = false;
          }
        }
        if (!existed) cards.add(vanguardCard);
      });
    } else {
      debugPrint('Nothing');
    }
    return Future.value(cards);
  }
}

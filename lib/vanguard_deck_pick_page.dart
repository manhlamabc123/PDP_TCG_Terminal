import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pdp_tcg/constants.dart';

class VanguardDeckPickPage extends StatefulWidget {
  const VanguardDeckPickPage({super.key});

  @override
  State<VanguardDeckPickPage> createState() => _VanguardDeckPickPageState();
}

class _VanguardDeckPickPageState extends State<VanguardDeckPickPage> {
  final urlImages = [
    "https://en.cf-vanguard.com/wordpress/wp-content/images/cardlist/grc02/grc02_001a.png",
    "https://en.cf-vanguard.com/wordpress/wp-content/images/cardlist/grc02/grc02_001b.png",
    "https://en.cf-vanguard.com/wordpress/wp-content/images/cardlist/grc02/grc02_002.png"
  ];

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
              return buildImage(urlImage, index);
            },
            options: CarouselOptions(
              height: 500,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
            ),
          ),
          const Text(
            'Name',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
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
}

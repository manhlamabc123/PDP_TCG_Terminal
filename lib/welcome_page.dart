import 'package:flutter/material.dart';
import 'package:pdp_tcg/constants.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Expanded(
          //   child: Container(
          //     decoration: const BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage("assets/1.jpg"),
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //   ),
          // ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 200, left: 20, right: 20),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Welcome to PDP Area 3.0\n",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        TextSpan(
                          text: "Where competition becomes fun!",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                FittedBox(
                  child: Container(
                    margin: const EdgeInsets.only(top: 350),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 26, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: kPrimaryColor,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Start',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Already have an account? Login here!',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

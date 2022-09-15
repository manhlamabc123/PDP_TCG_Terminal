import 'package:flutter/material.dart';
import 'package:pdp_tcg/constants.dart';
import 'package:pdp_tcg/lists.dart';
import 'package:pdp_tcg/pages/user_profile/appbar_widget.dart';

class LeaderBoardPage extends StatelessWidget {
  const LeaderBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Leader Broad"),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(34),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 5, right: 10, left: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: kPrimaryColor2,
                              borderRadius: BorderRadius.circular(34),
                              border:
                                  Border.all(color: kPrimaryColor, width: 4),
                            ),
                            child: ListTile(
                              leading: SizedBox(
                                height: double.infinity,
                                child: iconList[0],
                              ),
                              title: Text("Username $index"),
                              subtitle: Text("Rank Point: $index"),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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

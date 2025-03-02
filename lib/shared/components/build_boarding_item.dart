import 'package:flutter/material.dart';

class BuildBoardingItem extends StatelessWidget {
  const BuildBoardingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(image: AssetImage("assets/images/onboard_1.png")),
        ),
        SizedBox(height: 30),
        Text(
          "Screen title",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        Text(
          "Screen Body",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

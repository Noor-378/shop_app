import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // PageView.builder(itemBuilder: (context, index) {}
          // )
          Image(image: AssetImage("assets/images/onboard_1.png",),),
        ],
      ),
    );
  }
}

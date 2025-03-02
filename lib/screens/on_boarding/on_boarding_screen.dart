import 'package:flutter/material.dart';
import 'package:shop_app/shared/components/build_boarding_item.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => BuildBoardingItem(),
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Text(
                  "Indicator",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

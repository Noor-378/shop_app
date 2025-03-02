import 'package:flutter/material.dart';
import 'package:shop_app/models/boarding_model.dart';
import 'package:shop_app/shared/components/build_boarding_item.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<BoardingModel> boarding = [
      BoardingModel(
        image: "assets/images/onboarding_1.png",
        title: "title1",
        body: "body1",
      ),
      BoardingModel(
        image: "assets/images/onboarding_2.png",
        title: "title2",
        body: "body2",
      ),
      BoardingModel(
        image: "assets/images/onboarding_3.png",
        title: "title3",
        body: "body3",
      ),
    ];
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: boarding.length,
              itemBuilder: (context, index) =>
                  BuildBoardingItem(model: boarding[index]),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Indicator",
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_forward_ios,
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

import 'package:flutter/material.dart';
import 'package:shop_app/models/boarding_model/boarding_model.dart';
import 'package:shop_app/screens/login_screen/login_screen.dart';
import 'package:shop_app/shared/components/build_boarding_item.dart';
import 'package:shop_app/shared/components/custom_text_button.dart';
import 'package:shop_app/shared/cubit/cubit/cubit.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  bool isLast = false;
  void submite() {
    CacheHelper.saveData(key: "onBoarding", value: true).then((value) {
      if (value!) {
        AppCubit.get(context).navigateAndFinish(
          context,
          LoginScreen(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 20),
        actions: [
          CustomTextButton(
            onPressed: () {
              if (isLast) {
                submite();
              } else {
                boardController.jumpToPage(boarding.length - 1);
              }
            },
            text: "Skip",
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (int index) {
                if (index == boarding.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              controller: boardController,
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
                SmoothPageIndicator(
                  effect: ExpandingDotsEffect(
                    activeDotColor: mainColor,
                    expansionFactor: 3,
                    spacing: 5,
                    dotHeight: 10,
                  ),
                  controller: boardController,
                  count: boarding.length,
                ),
                CustomTextButton(
                  onPressed: () {
                    if (isLast) {
                      submite();
                    } else {
                      boardController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  text: isLast ? "Get Started" : "Next",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

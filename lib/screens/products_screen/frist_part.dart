
import 'package:animated_indicators/animated_indicators.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shared/cubit/cubit/cubit.dart';
import 'package:shop_app/shared/styles/colors.dart';

class FristPart extends StatelessWidget {
  const FristPart({
    super.key,
    required this.cubit,
  });
  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: customBannerImages.map((e) {
            return Image(
              image: NetworkImage(e),
            );
          }).toList(),
          options: CarouselOptions(
            enlargeCenterPage: true,
            enlargeFactor: .3,
            autoPlay: true,
            viewportFraction: .8,
            height: 160,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlayAnimationDuration: Duration(
              seconds: 1,
            ),
            autoPlayInterval: Duration(
              seconds: 3,
            ),
            onPageChanged: (index, reason) {
              cubit.changeIndicatorColorForBanner(index);
            },
          ),
        ),
        AnimatedIndicators(
          activeIndex: cubit.currentBannerPage,
          length: customBannerImages.length,
          activeColor: mainColor,
          noActiveColor: Colors.grey,
          width: 25,
          radius: 5,
        ),
      ],
    );
  }
}

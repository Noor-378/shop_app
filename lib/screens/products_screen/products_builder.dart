import 'package:animated_indicators/animated_indicators.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/home_model/home_model.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shared/cubit/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states/states.dart';
import 'package:shop_app/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductsBuilder extends StatelessWidget {
  const ProductsBuilder({
    super.key,
    required this.model,
  });
  final HomeModel? model;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Column(
          children: [
            SizedBox(
              height: 20,
            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedIndicators(
                  activeIndex: cubit.currentBannerPage,
                  length: customBannerImages.length,
                  activeColor: mainColor,
                  noActiveColor: Colors.grey,
                  width: 25,
                  radius: 5,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

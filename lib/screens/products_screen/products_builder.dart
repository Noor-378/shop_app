import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/home_model/home_model.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shared/cubit/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states/states.dart';
import 'package:shop_app/shared/styles/colors.dart';

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
              items: customBanner.map((e) {
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
                for (int i = 0; i < customBanner.length; i++)
                  Container(
                    height: i == cubit.currentBannerPage ? 7 : 5,
                    width: i == cubit.currentBannerPage ? 7 : 5,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: i == cubit.currentBannerPage
                          ? mainColor
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}

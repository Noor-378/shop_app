import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/home_model/home_model.dart';

class ProductsBuilder extends StatelessWidget {
  const ProductsBuilder({
    super.key,
    required this.model,
  });
  final HomeModel? model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: model!.data!.banners.map((e) {
            return Image(
              image: NetworkImage("${e.image}"),
              fit: BoxFit.cover,
              width: double.infinity,
            );
          }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1,
            height: 250,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlayAnimationDuration: Duration(
              seconds: 1,
            ),
            autoPlayInterval: Duration(
              seconds: 3,
            ),
          ),
        ),
      ],
    );
  }
}

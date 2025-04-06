
import 'package:flutter/material.dart';
import 'package:shop_app/models/home_model/home_model.dart';

class SecondPart extends StatelessWidget {
  const SecondPart({
    super.key,
    required this.model,
    required this.index,
  });
  final int index;
  final HomeModel? model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          height: 150,
          width: 150,
          image: NetworkImage(
            model!.data!.products[index].image,
          ),
        ),
      ],
    );
  }
}

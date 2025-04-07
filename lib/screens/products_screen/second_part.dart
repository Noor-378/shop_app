import 'package:flutter/material.dart';
import 'package:shop_app/models/categories_model/categories_model.dart';

class SecondPart extends StatelessWidget {
  const SecondPart({super.key, required this.categoriesModel});
  final CategoriesModel? categoriesModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoriesItem(
          model: categoriesModel,
          index: index,
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        itemCount: categoriesModel!.data!.data.length,
      ),
    );
  }
}

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    super.key,
    required this.model,
    required this.index,
  });
  final CategoriesModel? model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image(
          height: 100,
          width: 100,
          fit: BoxFit.cover,
          image: NetworkImage("${model!.data!.data[index].image}"),
        ),
        Container(
          width: 100,
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(150),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(6),
              topLeft: Radius.circular(6),
            ),
          ),
          child: Text(
            "${model!.data!.data[index].name}",
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

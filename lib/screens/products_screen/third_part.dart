import 'package:flutter/material.dart';
import 'package:shop_app/models/home_model/home_model.dart';
import 'package:shop_app/shared/styles/colors.dart';

class ThirdPart extends StatelessWidget {
  const ThirdPart({
    super.key,
    required this.model,
    required this.index,
  });
  final int index;
  final HomeModel? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image(
                width: double.infinity,
                height: 200,
                image: NetworkImage(
                  model!.data!.products[index].image,
                ),
              ),
              if (model!.data!.products[index].discount != 0)
                Container(
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: Text(
                    "DISCOUNT",
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${model!.data!.products[index].name}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.3,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "${model!.data!.products[index].price.round()}",
                      style: TextStyle(
                        fontSize: 12,
                        color: mainColor,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    if (model!.data!.products[index].discount != 0)
                      Text(
                        "${model!.data!.products[index].oldPrice.round()}",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    Spacer(),
                    IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        size: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

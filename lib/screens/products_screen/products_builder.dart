import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/categories_model/categories_model.dart';
import 'package:shop_app/models/home_model/home_model.dart';
import 'package:shop_app/screens/products_screen/frist_part.dart';
import 'package:shop_app/screens/products_screen/second_part.dart';
import 'package:shop_app/screens/products_screen/third_part.dart';
import 'package:shop_app/shared/cubit/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states/states.dart';

class ProductsBuilder extends StatelessWidget {
  const ProductsBuilder({
    super.key,
    required this.model,
    required this.categoriesModel,
  });
  final HomeModel? model;
  final CategoriesModel? categoriesModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              // frist part contain the CarouselSlider carousel slider and the indicator
              FristPart(cubit: cubit),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // second part contain all the categories part in the home screen
                    SecondPart(
                      categoriesModel: categoriesModel,
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    Text(
                      "New Products",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey,
                child: GridView.count(
                  childAspectRatio: 1 / 1.583,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: List.generate(
                    model!.data!.products.length,
                    (index) =>
                        // Third part contain all the grid view widgets
                        ThirdPart(
                      model: model,
                      index: index,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

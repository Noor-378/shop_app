import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/home_model/home_model.dart';
import 'package:shop_app/screens/products_screen/frist_part.dart';
import 'package:shop_app/screens/products_screen/second_part.dart';
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

        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              // frist part contain the CarouselSlider carousel slider and the indicator
              FristPart(cubit: cubit),
              SizedBox(
                height: 20,
              ),
              Container(
                color: mainColor,
                child: GridView.count(
                  childAspectRatio: 1 / 1.2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: List.generate(
                    model!.data!.products.length,
                    (index) =>
                        // second part contain all the grid view widgets
                        SecondPart(
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

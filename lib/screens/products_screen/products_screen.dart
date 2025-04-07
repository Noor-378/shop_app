import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/products_screen/products_builder.dart';
import 'package:shop_app/shared/cubit/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states/states.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (AppCubit.get(context).homeModel != null &&
            AppCubit.get(context).categoriesModel != null) {
          return ProductsBuilder(
            model: AppCubit.get(context).homeModel,
            categoriesModel: AppCubit.get(context).categoriesModel,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

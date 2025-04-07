import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/categories_model/categories_model.dart';
import 'package:shop_app/shared/cubit/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states/states.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => CategoriesItem(
            model: AppCubit.get(context).categoriesModel!.data!.data[index],
          ),
          separatorBuilder: (context, index) => Divider(
            indent: 20,
            color: Colors.grey,
            thickness: .2,
          ),
          itemCount: AppCubit.get(context).categoriesModel!.data!.data.length,
        );
      },
    );
  }
}

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    super.key,
    required this.model,
  });
  final DataModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Image(
            width: 100,
            height: 100,
            image: NetworkImage(
              "${model.image}",
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "${model.name}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }
}

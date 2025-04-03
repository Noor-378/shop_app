import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states/states.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return AppCubit.get(context).homeModel == null
            ? CircularProgressIndicator()
            : Center(
                child: Text(
                  "Products Screen",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
      },
    );
  }
}

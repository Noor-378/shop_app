import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/custom_app_bar.dart';
import 'package:shop_app/shared/components/custom_bottom_nav_bar.dart';
import 'package:shop_app/shared/cubit/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states/states.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: CustomAppBar(cubit, context),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: CustomBottomNavBar(cubit: cubit),
        );
      },
    );
  }
}

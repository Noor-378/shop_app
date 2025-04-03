import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          appBar: AppBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(
                  image: AssetImage(
                    "assets/images/go_logo.png",
                  ),
                  height: 50,
                ),
                Text(
                  "Market",
                ),
              ],
            ),
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (value) {
              cubit.changeBottomNav(value);
            },
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(
                  Icons.home_outlined,
                ),
              ),
              BottomNavigationBarItem(
                label: "Category",
                icon: Icon(
                  Icons.apps_rounded,
                ),
              ),
              BottomNavigationBarItem(
                label: "Favorites",
                icon: Icon(
                  Icons.favorite_border_sharp,
                ),
              ),
              BottomNavigationBarItem(
                label: "Settings",
                icon: Icon(
                  Icons.settings_outlined,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

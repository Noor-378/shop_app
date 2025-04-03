
import 'package:flutter/material.dart';
import 'package:shop_app/shared/cubit/cubit/cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}

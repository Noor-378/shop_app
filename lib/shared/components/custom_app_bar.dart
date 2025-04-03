
  import 'package:flutter/material.dart';
import 'package:shop_app/screens/search_screen/search_screen.dart';
import 'package:shop_app/shared/cubit/cubit/cubit.dart';

PreferredSizeWidget CustomAppBar(AppCubit cubit, BuildContext context) {
    return AppBar(
          actions: [
            IconButton(
              onPressed: () {
                cubit.navigateTo(
                  context,
                  SearchScreen(),
                );
              },
              icon: Icon(
                Icons.search_outlined,
              ),
            ),
          ],
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
        );
  }

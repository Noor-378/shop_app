import 'package:flutter/material.dart';
import 'package:shop_app/models/home_model/home_model.dart';
import 'package:shop_app/screens/categories_screen/categories_screen.dart';
import 'package:shop_app/screens/favorites_screen/favorites_screen.dart';
import 'package:shop_app/screens/products_screen/products_screen.dart';
import 'package:shop_app/screens/settings_screen/settings_screen.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shared/cubit/states/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  void navigateTo(context, Widget widget) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );
  void navigateAndFinish(context, Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );
  }

  int currentIndex = 0;
  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  HomeModel? homeModel;

  void getHomeData() {
    emit(LoadingHomeDataState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      emit(SuccessHomeDataState());
    }).catchError((error) {
      emit(ErrorHomeDataState());
      print(error.toString());
    });
  }

  int currentBannerPage = 0;
  PageController indicatorController = PageController();
  void changeIndicatorColorForBanner(
    int index,
  ) {
    currentBannerPage = index;
    // indicatorController = index;
    emit(ChangeIndicatorColorForBanner());
  }
}

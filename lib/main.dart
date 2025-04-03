import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_layout.dart';
import 'package:shop_app/screens/login_screen/login_screen.dart';
import 'package:shop_app/screens/on_boarding/on_boarding_screen.dart';
import 'package:shop_app/shared/constants.dart';
import 'package:shop_app/shared/cubit/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/observer/observer.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/styles/themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool onBoarding = CacheHelper.getData(key: "onBoarding") ?? false;
   token = CacheHelper.getData(key: "token");
  late Widget widget;
  if(onBoarding){
    if(token != null){
      widget = ShopLayout();
    }else{
      widget = LoginScreen();
    }
  }else{
    widget = OnBoardingScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.startWidget});
  final Widget? startWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..getHomeData(),
        )
      ],
      child: MaterialApp(
        title: "Simple Shop App",
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        // darkTheme: darkTheme,
        home: startWidget,
      ),
    );
  }
}

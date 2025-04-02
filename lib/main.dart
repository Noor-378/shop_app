import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/on_boarding/on_boarding_screen.dart';
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

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        )
      ],
      child: MaterialApp(
        title: "Simple Shop App",
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        // darkTheme: darkTheme,
        home: OnBoardingScreen(),
      ),
    );
  }
}

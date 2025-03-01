import 'package:flutter/material.dart';
import 'package:shop_app/screens/on_boarding/on_boarding_screen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Simple Shop App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: OnBoardingScreen(),
    );
  }
}
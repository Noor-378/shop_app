import 'package:flutter/material.dart';
import 'package:shop_app/shared/styles/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.height = 40,
    this.width = 350,
    this.color = mainColor,
  });
  final Widget child;
  final Function()? onPressed;
  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        fixedSize: Size(
          width,
          height,
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

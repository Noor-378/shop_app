import 'package:flutter/material.dart';
import 'package:shop_app/shared/styles/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.height = 40,
    this.width = 350,
  });
  final String text;
  final Function()? onPressed;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: mainColor,
        fixedSize: Size(
          width,
          height,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

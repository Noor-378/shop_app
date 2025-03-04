import 'package:flutter/material.dart';
import 'package:shop_app/shared/styles/colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isBlue = true,
    this.notBlueColor = Colors.white,
    this.underline = false,
  });
  final Function()? onPressed;
  final String text;
  final bool isBlue;
  final Color notBlueColor;
  final bool underline;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isBlue ? mainColor : notBlueColor,
          fontWeight: FontWeight.w900,
          decoration: underline ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
    );
  }
}

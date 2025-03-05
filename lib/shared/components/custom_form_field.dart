import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.type,
    required this.controller,
    required this.validate,
    required this.label,
    required this.icon,
    required this.hint,
    this.suffixIcon,
    this.suffixOnPressed,
    this.onSubmite,
    this.keyboardButton = TextInputAction.done,
  });
  final TextInputType type;
  final TextEditingController controller;
  final String? Function(String?)? validate;
  final String label;
  final IconData icon;
  final String hint;
  final IconData? suffixIcon;
  final void Function()? suffixOnPressed;
  final void Function(String)? onSubmite;
  final TextInputAction  keyboardButton;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: keyboardButton,
      cursorOpacityAnimates: true,
      onFieldSubmitted: onSubmite,
      keyboardType: type,
      controller: controller,
      validator: validate,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        label: Text(
          label,
        ),
        hintText: hint,
        suffixIcon: IconButton(
            onPressed: suffixOnPressed,
            icon: Icon(
              suffixIcon,
            )),
        prefixIcon: Icon(
          icon,
        ),
      ),
    );
  }
}

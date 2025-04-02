import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void CustomToast({
  required String msg,
  required Color color,
  Color textColor = Colors.white,
}) =>
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: color,
      textColor: textColor,
      fontSize: 16,
    );

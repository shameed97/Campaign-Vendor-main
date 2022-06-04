import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomDisplays {
  static showToast(
      {required String msg,
      required BuildContext context,
      duration,
      gravity,
      radius = 20}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showSnackBar(
      {required String message,
      required BuildContext context,
      double fontSize = 16.0,
      int duration = 3000}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: fontSize,
              letterSpacing: 0.5,
              color: Colors.red,
              fontWeight: FontWeight.w600),
        ),
        duration: Duration(milliseconds: duration),
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }

  static Future<dynamic> showProgress(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: SizedBox(
              width: 80,
              height: 80,
              child: Image.asset("assets/loader.gif")),
        );
      },
    );
  }

  static closeDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}

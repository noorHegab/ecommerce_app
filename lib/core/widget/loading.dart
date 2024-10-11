import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading {
  static show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(
            child: Lottie.asset("assets/images/loading.json"),
          ),
        );
      },
    );
  }

  static hide(BuildContext context) {
    Navigator.pop(context);
  }
}

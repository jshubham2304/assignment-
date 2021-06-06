import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppWidget {
  AppWidget._();

  static void errorSnackbar({@required String msg}) {
    return Get.snackbar(
      "Error !",
      '$msg',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      snackStyle: SnackStyle.GROUNDED,
      padding: EdgeInsets.all(8),
      colorText: Colors.white,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeb_pay_assignment/utils/app_color.dart';
import 'package:zeb_pay_assignment/view/page/splash_screen.dart';

import 'controller/currency_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(CurrenyController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: primaryblue),
            backgroundColor: primaryblue,
          ),
          fontFamily: GoogleFonts.openSans().fontFamily),
      home: SplashScreen(),
    );
  }
}

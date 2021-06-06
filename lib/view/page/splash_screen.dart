import 'package:flutter/material.dart';
import 'package:zeb_pay_assignment/imports/view_import.dart';
import 'package:zeb_pay_assignment/utils/app_color.dart';
import 'package:zeb_pay_assignment/utils/strings.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 5)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Scaffold(
                backgroundColor: primaryblue,
                body: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Image.asset(
                        "assets/images/logo.png",
                        color: Colors.white,
                        scale: 6.5,
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 0,
                      right: 0,
                      child: Text(
                        appName,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return HomePage();
          }
        },
      ),
    );
  }
}

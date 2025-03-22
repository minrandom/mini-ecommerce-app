import 'dart:async';
//import 'dart:ui_web';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'routes/app_pages.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      final token = box.read('token');
      if (token == null) {
        Get.offAllNamed('/login'); // go to login page
      } else {
        Get.offAllNamed('/home'); // go to product list page
      }

    });

    return MaterialApp(
        home: Scaffold(
            body: Container(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /*Image.asset(
            'assets/logo.png',
            height: 200,
            width: 300,
          ),*/    Lottie.asset("assets/animatelogo.json")
                    ]
                )
            )
        )
    );
  }
}
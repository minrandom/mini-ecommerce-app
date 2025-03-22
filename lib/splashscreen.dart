import 'dart:async';
//import 'dart:ui_web';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Get.toNamed("/home");

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
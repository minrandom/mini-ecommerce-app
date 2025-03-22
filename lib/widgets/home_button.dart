import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Get.offAllNamed(Routes.home);
      },
      icon: const Icon(Icons.home),
      label: const Text("Go to Home"),
    );
  }
}

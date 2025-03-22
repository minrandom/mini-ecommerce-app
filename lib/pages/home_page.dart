import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/cart_controller.dart';
import '../widgets/logout_button.dart';
import '../widgets/home_button.dart';
import '../widgets/cart_badge_icon.dart';
import '../widgets/cart_warning_widget.dart';
import '../widgets/bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  final authController = Get.put(AuthController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    cartController.fetchCart(); // Load cart data on home screen

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          LogoutButton(),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Welcome!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            Text("User ID: ${authController.storage.read('user_id') ?? 'Unknown'}"), // FIXED ✅

            const SizedBox(height: 20),

            CartWarningWidget(),

            const SizedBox(height: 30),
            const HomeButton(),
          ],
        ),
      ),
        bottomNavigationBar: const BottomNavBar(),
    );

  }
}

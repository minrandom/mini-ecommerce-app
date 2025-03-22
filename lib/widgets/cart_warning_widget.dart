import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class CartWarningWidget extends StatelessWidget {
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (cartController.totalItemCount > 0) {
        return Container(
          padding: const EdgeInsets.all(12),
          color: Colors.amber.shade100,
          child: Text(
            "⚠️ You have ${cartController.totalItemCount} items in your cart that need to be checked out!",
            style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        );
      } else {
        return const Text("✅ No pending carts, you are good to go!");
      }
    });
  }
}

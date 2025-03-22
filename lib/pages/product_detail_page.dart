import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/home_button.dart';
import '../widgets/logout_button.dart';
import '../controllers/cart_controller.dart';
import '../models/product_model.dart';
import '../widgets/cart_badge_icon.dart';
import '../widgets/bottom_nav_bar.dart';

class ProductDetailPage extends StatelessWidget {
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    final Product product = Get.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          HomeButton(),
          CartBadgeIcon(),
          LogoutButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 80),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              "Rp. ${product.price.toStringAsFixed(2)}",
              style: const TextStyle(
                color: Colors.green,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  cartController.addToCart(product.id);
                  Get.snackbar("Success", "${product.name} added to cart!");
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text("Add to Cart"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

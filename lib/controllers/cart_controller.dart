import 'package:get/get.dart';
import '../models/cart_item_model.dart';
import '../services/api_service.dart';



class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;
  var isLoading = false.obs;


  void fetchCart() async {
    try {
      isLoading(true);
      var response = await ApiService.dio.get("/cart");
      cartItems.value = (response.data as List)
          .map((item) => CartItem.fromJson(item))
          .toList();
    } catch (e) {
      print("Error loading cart: $e");
    } finally {
      isLoading(false);
    }
  }

  void addToCart(int productId) async {
    try {
      await ApiService.dio.post('/cart/add', data: {
        'product_id': productId,
        'quantity': 1,
      });
      fetchCart(); // refresh cart
      Get.snackbar('Success', 'Item added to cart');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add to cart');
    }
  }

  void removeFromCart(int id) async {
    try {
      await ApiService.dio.delete('/cart/remove/$id');
      fetchCart(); // refresh cart
      Get.snackbar('Removed', 'Item removed');
    } catch (e) {
      Get.snackbar('Error', 'Failed to remove item');
    }
  }

  Future<void> checkout() async {
    try {
      await ApiService.dio.post('/cart/checkout');
      cartItems.clear();
      Get.snackbar('Success', 'Checkout completed!');
    } catch (e) {
      Get.snackbar('Error', 'Checkout failed');
    }
  }

  double get totalAmount {
    return cartItems.fold(
        0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  int get totalItemCount => cartItems.fold(0, (sum, item) => sum + item.quantity);
}

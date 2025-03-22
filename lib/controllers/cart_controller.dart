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
    await ApiService.dio.post("/cart/add", data: {
      "product_id": productId,
      "quantity": 1,
    });
    fetchCart();
  }

  void removeFromCart(int id) async {
    await ApiService.dio.delete("/cart/remove/$id");
    fetchCart();
  }

  double get totalAmount {
    return cartItems.fold(
        0, (sum, item) => sum + (item.product.price * item.quantity));
  }
}

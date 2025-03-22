import 'package:get/get.dart';
import '../services/api_service.dart';
import '../models/product_model.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var response = await ApiService.dio.get("/products");
      if (response.statusCode == 200) {
        productList.value = (response.data as List)
            .map((item) => Product.fromJson(item))
            .toList();
      }
    } catch (e) {
      print("Error fetching products: $e");
    } finally {
      isLoading(false);
    }
  }
}

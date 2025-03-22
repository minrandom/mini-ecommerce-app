import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import '../services/api_service.dart';
import '../routes/app_pages.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  final storage = GetStorage();

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      final response = await ApiService.dio.post('/login', data: {
        'email': email,
        'password': password,
      });

      String token = response.data['token'];
      storage.write('token', token);
      //storage.write('user_id', response.data['user']['id']); // <--- new line

      // Move to Home after login
      Get.offAllNamed(Routes.home);
    } on DioException catch (e) {
      Get.snackbar('Login Failed', e.response?.data['error'] ?? 'Server error');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    storage.erase(); // Clear token & user_id
    Get.offAllNamed('/login');
  }

  Future<void> register(String name, String email, String password) async {
    isLoading.value = true;
    try {
      final response = await ApiService.dio.post('/register', data: {
        'name': name,
        'email': email,
        'password': password,
      });

      // auto-login after register
      storage.write('token', response.data['token']);
      storage.write('user_id', response.data['user']['id']);
      Get.offAllNamed(Routes.home);
    } on DioException catch (e) {
      Get.snackbar('Register Failed', e.response?.data['error'] ?? 'Server error');
    } finally {
      isLoading.value = false;
    }
  }


  String? get token => storage.read('token');
}

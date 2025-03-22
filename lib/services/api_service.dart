import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ApiService {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://127.0.0.1:8000/api",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  )..interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      final token = GetStorage().read('token');
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      return handler.next(options);
    },
  ));
}

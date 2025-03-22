import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = "http://127.0.0.1:8000/api"; // replace with server IP later

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    ),
  );


}

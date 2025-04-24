import 'package:dio/dio.dart';

class HttpClient {
  static final HttpClient _instance = HttpClient._internal();
  late Dio dio;

  factory HttpClient() => _instance;

  HttpClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: '',
        connectTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Dio get client => dio;

  void updateBaseUrl(String newBaseUrl){
    dio.options.baseUrl = newBaseUrl;
  }

  void updateHeaders(Map<String, String> newHeaders) {
    dio.options.headers = newHeaders;
  }
}

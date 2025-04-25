import 'package:dio/dio.dart';
import 'http_client.dart';

class HttpService {
  final Dio _dio = HttpClient().client;

  /* GET responses from http client */
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParams,
  }) async {
    return await _dio.get<T>(path, queryParameters: queryParams);
  }

  /* POST payload to http client */
  Future<Response<T>> post<T>(String path, dynamic data) async {
    return await _dio.post<T>(path, data: data);
  }

  /* PUT payload modeled into http client */
  Future<Response<T>> put<T>(String path, dynamic data) async {
    return await _dio.put<T>(path, data: data);
  }

  /* DELETE action to http cliente */
  Future<Response<T>> delete<T>(
    String path, {
    Map<String, dynamic>? queryParams,
  }) async {
    return await _dio.delete<T>(path, queryParameters: queryParams);
  }
}

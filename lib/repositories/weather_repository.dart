import 'package:dio/dio.dart';
import '../shared/core/http_config.dart';
import '../shared/core/http_service.dart';
import '../config/constants.dart';

class WeatherRepository {
  final HttpService _httpService = HttpService();
  final String _apiKey = Constants.openWeatherKey;

  WeatherRepository(){
    HttpConfig.baseUrl = Constants.openWeatherBaseUrl;
  }

  Future<Response> getWeatherByCity(String city) async {
    return await _httpService.get(HttpConfig.baseUrl, queryParams: {
      'q': city,
      'appid': _apiKey,
      'units': 'metric',
      'lang': 'es'
    });
  }
}
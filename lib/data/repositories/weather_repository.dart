
import 'package:weather_app/config/constants.dart';
import 'package:weather_app/data/datasources/geo_locator.dart';
import 'package:weather_app/data/models/hourly_weather.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/models/weekly_weather.dart';
import 'package:weather_app/data/services/http_config.dart';
import 'package:weather_app/data/services/http_service.dart';

class WeatherRepository {
  final HttpService _httpService = HttpService();
  final String _apiKey = Constants.openWeatherKey;
  final String _openMeteoBaseUrl = Constants.openMeteoBaseUrl;
  static double lat = 0.0;
  static double long = 0.0;

  WeatherRepository() {
    HttpConfig.baseUrl = Constants.openWeatherBaseUrl;
  }

  static Future<void> _fetchLocation() async {
    final location = await determinePosition();
    lat = location.latitude;
    long = location.longitude;
  }

  String _constructWeatherUrl() =>
      '${HttpConfig.baseUrl}weather?lat=$lat&lon=$long&units=metric&appid=$_apiKey';

  String _constructForectastUrl() =>
      '${HttpConfig.baseUrl}forecast?lat=$lat&lon=$long&units=metric&appid=$_apiKey';

  String _constructWeatherByCity(String cityName) =>
      '${HttpConfig.baseUrl}weather?q=$cityName&units=metric&appi=$_apiKey';

  String _constructWeeklyForecastUrl() =>
      '$_openMeteoBaseUrl&latitude=$lat&longitude=$long';

  /*
  * Current weather
   */
  Future<Weather> fetchWeatherByCurrentLocation() async {
    await _fetchLocation();
    final url = _constructWeatherUrl();
    final response = await _httpService.get(url);
    return Weather.fromJson(response.data);
  }

  /*
  * Hourly weather
   */
  Future<HourlyWeather> fetchForecastByCurrentLocation() async {
    await _fetchLocation();
    final url = _constructForectastUrl();
    final response = await _httpService.get(url);
    return HourlyWeather.fromJson(response.data);
  }

  /*
  * Get weather by city
   */
  Future<Weather> fetchWeatherByCity({required String cityName}) async {
    final url = _constructWeatherByCity(cityName);
    final response = await _httpService.get(url);
    return Weather.fromJson(response.data);
  }

  /*
  * Weekly weather
   */
  Future<WeeklyWeather> fetchWeeklyForecast() async {
    await _fetchLocation();
    final url = _constructWeeklyForecastUrl();
    final response = await _httpService.get(url);
    return WeeklyWeather.fromJson(response.data);
  }
}

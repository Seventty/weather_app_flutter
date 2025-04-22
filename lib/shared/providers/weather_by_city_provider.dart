import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repositories/weather_repository.dart';

final weatherByCityProvider = FutureProvider.autoDispose.family<Weather, String>((ref, String cityName) async {
  return WeatherRepository().fetchWeatherByCity(cityName: cityName);
});
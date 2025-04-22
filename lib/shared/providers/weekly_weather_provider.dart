import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/repositories/weather_repository.dart';

final weeklyWeatherProvider = FutureProvider.autoDispose((ref) async {
  return WeatherRepository().fetchWeeklyForecast();
});
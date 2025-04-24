import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepository();
});

final currentWeatherProvider = FutureProvider.autoDispose((ref) async {
  final repo = ref.read(weatherRepositoryProvider);
  return await repo.fetchWeatherByCurrentLocation();
});

final hourlyWeatherProvider = FutureProvider.autoDispose((ref) async {
  final repo = ref.read(weatherRepositoryProvider);
  return await repo.fetchForecastByCurrentLocation();
});

final weatherByCityProvider = FutureProvider.autoDispose.family<Weather, String>((ref, cityName) async {
  final repo = ref.read(weatherRepositoryProvider);
  return await repo.fetchWeatherByCity(cityName: cityName);
});

final weeklyWeatherProvider = FutureProvider.autoDispose((ref) async {
  final repo = ref.read(weatherRepositoryProvider);
  return await repo.fetchWeeklyForecast();
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/repositories/weather_repository.dart';

final currentWeatherProvider = FutureProvider.autoDispose((ref) {
  return WeatherRepository().fetchForecastByCurrentLocation();
});

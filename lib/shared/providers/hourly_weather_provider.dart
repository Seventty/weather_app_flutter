import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/repositories/weather_repository.dart';

final hourlyWeatherProvider = FutureProvider.autoDispose((ref) async {
  return WeatherRepository().fetchForecastByCurrentLocation();
});
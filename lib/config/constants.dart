import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


@immutable
class Constants {
  static String get openWeatherKey => dotenv.env['OPEN_WEATHER_KEY'] ?? '';
  static String get openWeatherBaseUrl => dotenv.env['OPEN_WEATHER_BASE_URL'] ?? '';
}
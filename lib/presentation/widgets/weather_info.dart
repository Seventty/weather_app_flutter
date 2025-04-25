import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/presentation/widgets/weather_info_title.dart';
import 'package:weather_app/shared/extensions/convert_wind_speed.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key, required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          WeatherInfoTitle(title: 'Temp', value: '${weather.main.temp}°'),
          WeatherInfoTitle(title: 'Wind', value: '${weather.wind.speed.kmh} km/h'),
          WeatherInfoTitle(title: 'Humidity', value: '${weather.main.humidity}%'),
        ],
      ),
    );
  }
}

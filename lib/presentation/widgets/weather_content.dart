import 'package:flutter/material.dart';
import 'package:weather_app/config/text_styles.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/presentation/widgets/weather_info.dart';
import 'package:weather_app/shared/extensions/datetime.dart';

class BuildWeatherContent extends StatelessWidget {
  final Weather weatherData;

  const BuildWeatherContent({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 30),
        Text(weatherData.name, style: TextStyles.h1),
        SizedBox(height: 20),
        Text(DateTime.now().dateTime, style: TextStyles.subtitleText),
        SizedBox(height: 30),
        SizedBox(
          height: 260,
          child: Image.asset(
            'assets/icons/${weatherData.weather[0].icon.replaceAll('n', 'd')}.png',
          ),
        ),
        SizedBox(height: 40),
        Text(weatherData.weather[0].description, style: TextStyles.h3),
        SizedBox(height: 40),
        WeatherInfo(weather: weatherData),
      ],
    );
  }
}

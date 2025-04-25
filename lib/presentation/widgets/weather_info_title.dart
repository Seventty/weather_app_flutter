import 'package:flutter/material.dart';
import 'package:weather_app/config/text_styles.dart';

class WeatherInfoTitle extends StatelessWidget {
  const WeatherInfoTitle({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyles.subtitleText),
        SizedBox(height: 10),
        Text(value, style: TextStyles.h3),
      ],
    );
  }
}

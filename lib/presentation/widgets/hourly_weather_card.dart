import 'package:flutter/material.dart';
import 'package:weather_app/config/app_colors.dart';
import 'package:weather_app/config/text_styles.dart';
import 'package:weather_app/shared/utils/get_weather_icons.dart';

class HourlyWeatherCard extends StatelessWidget {
  const HourlyWeatherCard({
    super.key,
    required this.id,
    required this.hour,
    required this.temp,
    required this.isActive,
  });

  final int id;
  final String hour;
  final int temp;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16, top: 12, bottom: 12),
      child: Material(
        color: isActive ? AppColors.lightBlue : AppColors.accentBlue,
        borderRadius: BorderRadius.circular(15.0),
        elevation: isActive ? 8 : 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(getWeatherIcon(weatherCode: id), width: 50),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(hour, style: TextStyle(color: AppColors.white)),
                  SizedBox(height: 5),
                  Text('$temp°', style: TextStyles.h3,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

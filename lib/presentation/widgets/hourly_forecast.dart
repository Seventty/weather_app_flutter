import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/config/text_styles.dart';
import 'package:weather_app/domain/providers/weather_providers.dart';
import 'package:weather_app/presentation/widgets/hourly_weather_card.dart';
import 'package:weather_app/shared/extensions/convert_timestamp_to_time.dart';

class HourlyForecast extends ConsumerWidget {
  const HourlyForecast({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hourlyWeatherData = ref.watch(hourlyWeatherProvider);

    return hourlyWeatherData.when(
      data: (hourlyWeatherData) {
        return SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: hourlyWeatherData.cnt,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final forecast = hourlyWeatherData.list[index];

              return HourlyWeatherCard(
                id: forecast.weather[0].id,
                hour: forecast.dt.time,
                temp: forecast.main.temp.round(),
                isActive: index == 0,
              );
            },
          ),
        );
      },

      error: (error, stackTrace) {
        return Row(
          children: [
            Icon(Icons.error_outline, color: Colors.redAccent, size: 64),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Algo salió mal', style: TextStyles.h2),
                  const SizedBox(height: 8),
                  Text(
                    error.toString(),
                    textAlign: TextAlign.start,
                    style: TextStyles.subtitleText,
                  ),
                ],
              ),
            ),
          ],
        );
      },

      loading: () {
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

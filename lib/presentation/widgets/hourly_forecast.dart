import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/config/text_styles.dart';
import 'package:weather_app/domain/providers/weather_providers.dart';
import 'package:weather_app/presentation/widgets/hourly_weather_title.dart';

class HourlyForecast extends ConsumerWidget {
  const HourlyForecast({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hourlyWeatherData = ref.watch(hourlyWeatherProvider);
    return hourlyWeatherData.when(
      data: (hourlyWeatherData) {
        return ListView.builder(
          itemCount: hourlyWeatherData.cnt,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            //final weather = hourlyWeatherData.list[index];

            return HourlyWeatherTitle();
          },
        );
      },

      error: (error, stackTrace) {
        return Row(
          children: [
            Icon(Icons.error_outline, color: Colors.redAccent, size: 64),
            const SizedBox(height: 16),
            Text('Algo salió mal', style: TextStyles.h2),
            const SizedBox(height: 8),
            Text(error.toString(), textAlign: TextAlign.center),
          ],
        );
      },

      loading: () {
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

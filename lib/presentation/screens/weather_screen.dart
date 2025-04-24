import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/config/text_styles.dart';
import 'package:weather_app/domain/providers/weather_providers.dart';
import 'package:weather_app/presentation/screens/weather/weather_content.dart';
import 'package:weather_app/presentation/widgets/gradient_container.dart';


class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherObserver = ref.watch(currentWeatherProvider);

    return weatherObserver.when(
      data: (weatherData) {
        return GradientContainer(
          children: [
            Center(child: BuildWeatherContent(weatherData: weatherData)),
          ],
        );
      },

      error: (error, stackTrace) {
        return GradientContainer(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Colors.redAccent, size: 64),
                  const SizedBox(height: 16),
                  Text('Algo salió mal', style: TextStyles.h2),
                  const SizedBox(height: 8),
                  Text(error.toString(), textAlign: TextAlign.center),
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
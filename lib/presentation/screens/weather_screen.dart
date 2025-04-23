import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/presentation/views/gradient_container.dart';
import 'package:weather_app/shared/providers/weather_providers.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherObserver = ref.watch(currentWeatherProvider);

    return weatherObserver.when(
      data: (weatherData) {
        return GradientContainer(children: []);
      },

      error: (error, stackTrace) {
        return Center(
          child: Text('An unexpected error: ${error.toString()}'),
        );
      },

      loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/repositories/weather_repository.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather app',
      debugShowCheckedModeBanner: false,
      home: WeatherScreen()
    );
  }
}


class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String _temperatureInfo = 'Cargando...';

  @override
  void initState() {
    super.initState();
    cargarClima();
  }

  void cargarClima() async {
    final weatherRepo = WeatherRepository();
    final response = await weatherRepo.getWeatherByCity('Santo Domingo');
    final data = response.data;

    setState(() {
      _temperatureInfo = "Temperatura actual en Santo Domingo: ${data['main']['temp']}°C";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather app')),
      body: Center(child: Text(_temperatureInfo)),
    );
  }
}
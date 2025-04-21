import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


@immutable
class Constants {
  static String get apikey => dotenv.env['API_KEY'] ?? '';
}
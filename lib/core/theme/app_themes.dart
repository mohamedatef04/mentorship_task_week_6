import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/dark_theme.dart';
import 'package:movies_app/core/theme/light_theme.dart';

abstract class AppTheme {
  static ThemeData getLightTheme() => lightTheme;
  static ThemeData getDarkTheme() => darkTheme;
}

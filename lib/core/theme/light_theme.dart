import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.background,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    onPrimary: AppColors.onPrimary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    error: AppColors.error,
    onError: AppColors.onError,
    primaryContainer: AppColors.primaryVariant,
    secondaryContainer: AppColors.secondaryVariant,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.onPrimary,
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.onPrimary,
  ),
);

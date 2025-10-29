import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.darkBackground,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.darkPrimary,
    onPrimary: AppColors.darkOnPrimary,
    secondary: AppColors.darkSecondary,
    onSecondary: AppColors.darkOnSecondary,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkOnSurface,
    error: AppColors.darkError,
    onError: AppColors.darkOnError,
    primaryContainer: AppColors.darkPrimaryVariant,
    secondaryContainer: AppColors.darkSecondaryVariant,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkPrimary,
    foregroundColor: AppColors.darkOnPrimary,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.darkPrimary,
    foregroundColor: AppColors.darkOnPrimary,
  ),
);

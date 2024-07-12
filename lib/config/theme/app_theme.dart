import 'package:flutter/material.dart';
import 'package:my_app/config/theme/app_colors.dart';
import 'package:my_app/constants/sizes.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lemonChiffon,
    appBarTheme: const AppBarTheme(color: AppColors.lemonChiffon),
    textTheme: AppTheme.textTheme,
    brightness: Brightness.light,
    primaryColor: AppColors.indianRed,
    cardColor: AppColors.mintGreen,
    dividerColor: AppColors.davyGrey,
    focusColor: AppColors.glaucous,
    unselectedWidgetColor: AppColors.grey,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.indianRed,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.indianRed,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.indianRed,
      ),
    ),
  );

  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: Sizes.size32,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    displayMedium: TextStyle(
      fontSize: Sizes.size28,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    displaySmall: TextStyle(
      fontSize: Sizes.size24,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    headlineMedium: TextStyle(
      fontSize: Sizes.size20,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    headlineSmall: TextStyle(
      fontSize: Sizes.size18,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    titleLarge: TextStyle(
      fontSize: Sizes.size32,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    titleMedium: TextStyle(
      fontSize: Sizes.size24,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    titleSmall: TextStyle(
      fontSize: Sizes.size18,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    bodyLarge: TextStyle(
      fontSize: Sizes.size28,
      color: AppColors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: Sizes.size12,
      color: AppColors.black,
    ),
    labelLarge: TextStyle(
      fontSize: Sizes.size24,
      color: AppColors.davyGrey,
    ),
    labelMedium: TextStyle(
      fontSize: Sizes.size16,
      color: AppColors.davyGrey,
    ),
    labelSmall: TextStyle(
      fontSize: Sizes.size12,
      color: AppColors.davyGrey,
    ),
  );
}

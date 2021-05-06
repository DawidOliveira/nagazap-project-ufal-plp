import 'package:flutter/material.dart';
import 'package:nagazap/app/core/app_colors.dart';

class AppTheme {
  static ThemeData themeLight = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.PURPLE,
    scaffoldBackgroundColor: AppColors.WHITE,
  );

  static ThemeData themeDark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.PURPLE,
    scaffoldBackgroundColor: AppColors.BLACK,
    textTheme: TextTheme(subtitle1: TextStyle(color: Colors.white)),
  );
}

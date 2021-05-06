import 'package:flutter/cupertino.dart';
import 'package:nagazap/app/core/app_colors.dart';

class AppTextStyles {
  static const TextStyle APP_BAR_TEXT = TextStyle(
    fontSize: 20,
    color: AppColors.WHITE,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle SUBTITLE = TextStyle(
    fontSize: 10,
    color: AppColors.GREY,
  );

  static const TextStyle MESSAGE = TextStyle(
    fontSize: 15,
    color: AppColors.WHITE,
  );

  static const TextStyle COMMON = TextStyle(
    color: AppColors.PURPLE_ERROR,
  );

  static const TextStyle ERROR_PURPLE = TextStyle(
    color: AppColors.PURPLE_ERROR,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
}

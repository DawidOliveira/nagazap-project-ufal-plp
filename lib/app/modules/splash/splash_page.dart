import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nagazap/app/core/app_colors.dart';
import 'package:nagazap/app/core/app_images.dart';
import 'package:nagazap/app/modules/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PURPLE,
      body: Center(
        child: Image.asset(AppImages.LOGO),
      ),
    );
  }
}

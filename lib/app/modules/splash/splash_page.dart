import 'package:flutter/material.dart';
import 'package:nagazap/app/core/app_colors.dart';
import 'package:nagazap/app/core/app_images.dart';
import 'package:nagazap/app/modules/splash/splash_controller.dart';
import 'package:nagazap/app/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashController controller;

  @override
  void initState() {
    super.initState();
    controller = SplashController(context, context.read<UserRepository>());
  }

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

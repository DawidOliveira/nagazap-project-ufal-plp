import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nagazap/app/core/app_route.dart';
import 'package:nagazap/app/core/app_theme.dart';
import 'package:nagazap/app/shared/application/application_bindings.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NagaZap',
      theme: AppTheme.themeLight,
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.getPages,
      initialBinding: ApplicationBindings(),
    );
  }
}

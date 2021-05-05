import 'package:flutter/material.dart';
import 'package:nagazap/app/core/app_route.dart';
import 'package:nagazap/app/core/app_theme.dart';
import 'package:nagazap/app/repositories/user_repository.dart';
import 'package:nagazap/app/services/auth_service.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserRepository>(create: (context) => UserRepository()),
        Provider<AuthService>(
            create: (context) => AuthService(context.read<UserRepository>())),
      ],
      child: MaterialApp(
        title: 'NagaZap',
        theme: AppTheme.themeLight,
        onGenerateRoute: AppRoutes.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nagazap/app/modules/home/home_page.dart';
import 'package:nagazap/app/modules/login/login_page.dart';
import 'package:nagazap/app/modules/room/room_page.dart';
import 'package:nagazap/app/modules/splash/splash_page.dart';
import 'package:nagazap/app/shared/models/user.dart';

class Routes {
  static const SPLASH = '/';
  static const HOME = '/home';
  static const ROOM = '/room';
  static const LOGIN = '/login';
}

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.SPLASH:
        return MaterialPageRoute(
          builder: (context) => SplashPage(),
        );
      case Routes.LOGIN:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case Routes.HOME:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
      case Routes.ROOM:
        final user = settings.arguments as User;
        return MaterialPageRoute(
          builder: (context) => RoomPage(
            user: user,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Center(
            child: Text('Página não encontrada!'),
          ),
        );
    }
  }
}

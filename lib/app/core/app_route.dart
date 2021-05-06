import 'package:get/get.dart';
import 'package:nagazap/app/modules/home/home_bindings.dart';
import 'package:nagazap/app/modules/home/home_page.dart';
import 'package:nagazap/app/modules/login/login_bindings.dart';
import 'package:nagazap/app/modules/login/login_page.dart';
import 'package:nagazap/app/modules/room/room_bindings.dart';
import 'package:nagazap/app/modules/room/room_page.dart';
import 'package:nagazap/app/modules/splash/splash_bindings.dart';
import 'package:nagazap/app/modules/splash/splash_page.dart';

class Routes {
  static const SPLASH = '/';
  static const HOME = '/home';
  static const ROOM = '/room';
  static const LOGIN = '/login';
}

class AppRoutes {
  AppRoutes._();

  static List<GetPage<dynamic>>? getPages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.ROOM,
      page: () => RoomPage(
        info: Get.arguments,
      ),
      binding: RoomBindings(),
    ),
  ];
}

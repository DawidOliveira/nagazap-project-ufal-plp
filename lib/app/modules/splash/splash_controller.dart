import 'package:nagazap/app/core/app_route.dart';
import 'package:nagazap/app/repositories/user_repository.dart';

import 'package:get/get.dart';

class SplashController extends GetxController {
  final UserRepository _userRepository;

  SplashController(this._userRepository) {
    Future.delayed(Duration(seconds: 1), () async {
      if (_userRepository.getUser())
        Get.offNamed(Routes.HOME);
      else
        Get.offNamed(Routes.LOGIN);
    });
  }
}

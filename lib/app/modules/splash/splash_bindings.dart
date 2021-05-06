import 'package:get/get.dart';
import 'package:nagazap/app/repositories/user_repository.dart';
import './splash_controller.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(Get.find<UserRepository>()));
  }
}

import 'package:get/get.dart';
import 'package:nagazap/app/services/auth_service.dart';
import './login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(Get.find<AuthService>()));
  }
}

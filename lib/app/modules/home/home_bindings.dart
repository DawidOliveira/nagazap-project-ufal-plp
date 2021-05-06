import 'package:get/get.dart';
import 'package:nagazap/app/repositories/user_repository.dart';
import 'package:nagazap/app/services/auth_service.dart';
import 'package:nagazap/app/services/socket_service.dart';
import './home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SocketService(Get.find<UserRepository>()));
    Get.put(HomeController(Get.find<UserRepository>(), Get.find<AuthService>(),
        Get.find<SocketService>()));
  }
}

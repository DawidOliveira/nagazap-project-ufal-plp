import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nagazap/app/repositories/user_repository.dart';
import 'package:nagazap/app/services/auth_service.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository(GetStorage()));
    Get.put(AuthService(Get.find<UserRepository>(), GetStorage()));
  }
}

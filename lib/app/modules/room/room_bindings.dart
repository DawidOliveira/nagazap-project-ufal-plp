import 'package:get/get.dart';
import 'package:nagazap/app/repositories/chat_repository.dart';
import 'package:nagazap/app/services/chat_service.dart';
import 'package:nagazap/app/services/socket_service.dart';
import './room_controller.dart';

class RoomBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ChatService());
    Get.put(RoomController(Get.find<ChatRepository>(), Get.find<ChatService>(),
        Get.arguments, Get.find<SocketService>()));
  }
}

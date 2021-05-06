import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nagazap/app/modules/home/home_controller.dart';
import 'package:nagazap/app/repositories/chat_repository.dart';
import 'package:nagazap/app/services/chat_service.dart';
import 'package:nagazap/app/services/socket_service.dart';
import 'package:nagazap/app/shared/models/message.dart';

class RoomController extends GetxController {
  final ChatService _chatService;
  final ChatRepository _chatRepository;
  final SocketService _socketService;
  final messages = ValueNotifier<List<Message>>([]);
  final Map<String, dynamic> roomInfo;
  final textController = TextEditingController();

  RoomController(this._chatRepository, this._chatService, this.roomInfo,
      this._socketService);

  @override
  void onInit() async {
    super.onInit();

    await initMessages();

    comunicationSocket();
  }

  Future<void> initMessages() async {
    messages.value = (await _chatRepository.getMessages())
        .where((element) => element.room == roomInfo['room'])
        .toList();
    messages.value = messages.value.reversed.toList();
  }

  void comunicationSocket() {
    _socketService.socket!.on('receiveMessage', (data) async {
      final message = Message.fromMap(data);
      messages.value.insert(0, message);
      messages.notifyListeners();
      await _chatService.saveMessage(message.toMap());
      await attLastMessage(message);
    });
  }

  Future<void> attLastMessage(Message message) async {
    if (Get.find<HomeController>().messages.value[roomInfo['room']] == null) {
      Get.find<HomeController>().messages.value =
          await _chatRepository.getLastMessagesForRoom();
    }
    Get.find<HomeController>().messages.value[roomInfo['room']]?.add(message);
    Get.find<HomeController>().messages.notifyListeners();
    print(Get.find<HomeController>().messages.value[roomInfo['room']]?.last);
  }

  Future addMessage() async {
    if (textController.text.isEmpty) return;
    final message = Message(
      id: Random.secure().nextDouble().toString(),
      text: textController.text,
      room: roomInfo['room'],
      senderId: roomInfo['me'].id,
      senderSocketId: roomInfo['me'].socketId,
      receiverId: roomInfo['user'].id,
      receiverSocketId: roomInfo['user'].socketId,
      date: DateTime.now(),
    );

    messages.value.insert(0, message);
    messages.notifyListeners();
    _socketService.socket!.emit('sendMessage', message.toMap());
    textController.clear();
    await _chatService.saveMessage(message.toMap());
    await attLastMessage(message);
  }
}

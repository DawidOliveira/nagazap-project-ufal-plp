import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nagazap/app/repositories/chat_repository.dart';
import 'package:nagazap/app/services/chat_service.dart';
import 'package:nagazap/app/shared/models/message.dart';

class RoomController extends GetxController {
  final ChatService _chatService;
  final ChatRepository _chatRepository;
  final messages = ValueNotifier<List<Message>>([]);
  final Map<String, dynamic> roomInfo;

  RoomController(this._chatRepository, this._chatService, this.roomInfo);

  @override
  void onInit() async {
    super.onInit();
    messages.value = await _chatRepository.getMessages();
    print(messages.value);
  }

  Future addMessage() async {
    final message = Message(
      id: Random.secure().nextDouble().toString(),
      text: 'text',
      room: roomInfo['room'],
      senderId: roomInfo['me'].id,
      receiverId: roomInfo['user'].id,
      date: DateTime.now(),
    );
    _chatService.saveMessage(message.toMap());
  }
}

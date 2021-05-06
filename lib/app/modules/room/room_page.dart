import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nagazap/app/modules/room/room_controller.dart';
import 'package:nagazap/app/modules/room/widgets/form_message_widget.dart';
import 'package:nagazap/app/modules/room/widgets/list_messages_widget.dart';

class RoomPage extends GetView<RoomController> {
  final Map info;

  const RoomPage({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(info['user'].name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListMessagesWidget(
              controller: controller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
              left: 5.0,
            ),
            child: FormMessageWidget(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}

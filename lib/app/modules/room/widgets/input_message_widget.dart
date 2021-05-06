import 'package:flutter/material.dart';
import 'package:nagazap/app/modules/room/room_controller.dart';

class InputMessageWidget extends StatelessWidget {
  final RoomController controller;
  const InputMessageWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.textController,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        hintText: 'Digite sua mensagem...',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
      ),
      maxLines: 8,
      minLines: 1,
    );
  }
}

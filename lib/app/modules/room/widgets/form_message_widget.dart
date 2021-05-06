import 'package:flutter/material.dart';
import 'package:nagazap/app/modules/room/room_controller.dart';
import 'package:nagazap/app/modules/room/widgets/input_message_widget.dart';

class FormMessageWidget extends StatelessWidget {
  final RoomController controller;
  const FormMessageWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InputMessageWidget(),
        ),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () async {
            await controller.addMessage();
          },
        )
      ],
    );
  }
}

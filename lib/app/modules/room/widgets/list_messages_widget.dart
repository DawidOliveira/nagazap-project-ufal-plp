import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nagazap/app/core/app_colors.dart';
import 'package:nagazap/app/core/app_text_styles.dart';
import 'package:nagazap/app/modules/room/room_controller.dart';

class ListMessagesWidget extends StatelessWidget {
  final RoomController controller;

  const ListMessagesWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.messages,
      builder: (_, __, ___) => ListView.builder(
        reverse: true,
        itemCount: controller.messages.value.length,
        itemBuilder: (context, index) {
          final message = controller.messages.value[index];
          return Container(
            margin: EdgeInsets.only(
              left: message.senderId == controller.roomInfo['me'].id ? 0 : 7,
              right: message.senderId == controller.roomInfo['me'].id ? 7 : 0,
            ),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment:
                  message.senderId == controller.roomInfo['me'].id
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * .8),
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 10.0, bottom: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft:
                          message.senderId != controller.roomInfo['me'].id
                              ? Radius.zero
                              : Radius.circular(6),
                      topLeft: Radius.circular(6),
                      bottomRight:
                          message.senderId == controller.roomInfo['me'].id
                              ? Radius.zero
                              : Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                    color: message.senderId == controller.roomInfo['me'].id
                        ? AppColors.PURPLE
                        : AppColors.GREY_CLARO,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.text,
                        style: AppTextStyles.MESSAGE,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        DateFormat('HH:mm').format(message.date),
                        style: AppTextStyles.SUBTITLE,
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nagazap/app/modules/home/home_controller.dart';
import 'package:nagazap/app/modules/home/widgets/item_contact_widget.dart';

class ListContactsWidget extends StatelessWidget {
  const ListContactsWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.filteredUsers,
      builder: (_, __, ___) => ListView.separated(
        shrinkWrap: true,
        itemCount: controller.filteredUsers.value.length,
        separatorBuilder: (_, __) => Divider(height: 0),
        itemBuilder: (__, index) {
          return ValueListenableBuilder(
              valueListenable: controller.messages,
              builder: (_, __, ___) {
                final user = controller.filteredUsers.value[index];
                var room = controller.me.value!.id.hashCode < user!.id.hashCode
                    ? '${controller.me.value!.id.hashCode}${user.id.hashCode}'
                    : '${user.id.hashCode}${controller.me.value!.id.hashCode}';
                final lastMessage =
                    controller.messages.value[room]?.last!.text ?? '';
                final date = controller.messages.value[room]?.last!.date ?? '';
                final lastDateMessage = date == ''
                    ? ''
                    : DateFormat('HH:mm').format(date as DateTime);
                return ItemContactWidget(
                  user: user,
                  controller: controller,
                  lastMessage: lastMessage,
                  room: room,
                  lastDateMessage: lastDateMessage,
                );
              });
        },
      ),
    );
  }
}

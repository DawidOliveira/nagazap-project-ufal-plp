import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nagazap/app/core/app_route.dart';
import 'package:nagazap/app/modules/home/home_controller.dart';
import 'package:nagazap/app/shared/models/user.dart';

class ItemContactWidget extends StatelessWidget {
  const ItemContactWidget({
    Key? key,
    required this.user,
    required this.controller,
  }) : super(key: key);

  final User user;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    var room = controller.me.value!.id.hashCode < user.id.hashCode
        ? '${controller.me.value!.id.hashCode}${user.id.hashCode}'
        : '${user.id.hashCode}${controller.me.value!.id.hashCode}';
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.ROOM,
          arguments: {
            'user': user,
            'me': controller.me.value,
            'room': room,
          },
        );
      },
      title: Text(user.name),
      subtitle: Text(
          controller.messages.value.map((e) => e[room]).toList().last!.text),
      leading: Icon(Icons.person),
      trailing: Text(DateFormat('HH:mm').format(
          controller.messages.value.map((e) => e[room]).toList().last!.date)),
    );
  }
}

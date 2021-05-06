import 'package:flutter/material.dart';
import 'package:nagazap/app/core/app_route.dart';
import 'package:nagazap/app/modules/home/home_controller.dart';
import 'package:nagazap/app/shared/models/user.dart';

class ItemContactWidget extends StatelessWidget {
  const ItemContactWidget({
    Key? key,
    required this.user,
    required this.controller,
    required this.lastMessage,
    required this.lastDateMessage,
    required this.room,
  }) : super(key: key);

  final User user;
  final HomeController controller;
  final String lastMessage;
  final String lastDateMessage;
  final String room;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.messages,
      builder: (_, __, ___) => ListTile(
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
        subtitle: Text(lastMessage),
        leading: Icon(Icons.person),
        trailing: Text(lastDateMessage),
      ),
    );
  }
}

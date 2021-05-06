import 'package:flutter/material.dart';
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
      valueListenable: controller.users,
      builder: (_, __, ___) => ListView.separated(
        shrinkWrap: true,
        itemCount: controller.users.value.length,
        separatorBuilder: (_, __) => Divider(height: 0),
        itemBuilder: (__, index) {
          final user = controller.users.value[index];
          return ItemContactWidget(user: user, controller: controller);
        },
      ),
    );
  }
}

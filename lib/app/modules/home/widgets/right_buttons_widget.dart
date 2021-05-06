import 'package:flutter/material.dart';
import 'package:nagazap/app/core/app_colors.dart';
import 'package:nagazap/app/modules/home/home_controller.dart';

class RightButtonsWidget extends StatelessWidget {
  final HomeController controller;

  const RightButtonsWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: AppColors.WHITE,
          ),
          onPressed: () {
            controller.setIsSearch = true;
          },
        ),
        PopupMenuButton(
          onSelected: (value) async {
            if (value == 'logout') {
              await controller.logout();
            }
          },
          icon: Icon(
            Icons.more_vert_outlined,
            color: AppColors.WHITE,
          ),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: 'logout',
                child: ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                  title: Text('logout'),
                ),
              )
            ];
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nagazap/app/core/app_colors.dart';
import 'package:nagazap/app/core/app_text_styles.dart';
import 'package:nagazap/app/modules/home/home_controller.dart';
import 'package:nagazap/app/modules/home/widgets/right_buttons_widget.dart';

class AppBarWidget extends PreferredSize {
  final HomeController controller;

  AppBarWidget({required this.controller})
      : super(
          preferredSize: Size.fromHeight(60),
          child: ValueListenableBuilder<bool>(
            valueListenable: controller.isSearch,
            builder: (_, value, ___) => Container(
              color: AppColors.PURPLE,
              padding: const EdgeInsets.only(left: 20),
              height: 80,
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (!value)
                      Text(
                        'NagaZap',
                        style: AppTextStyles.APP_BAR_TEXT,
                      ),
                    if (value)
                      Expanded(
                        child: TextField(
                          autofocus: true,
                          controller: controller.searchName,
                          onChanged: controller.changeFilteredUsers,
                          decoration: InputDecoration(
                            hintText: 'Procure por alguém...',
                          ),
                          style: TextStyle(color: AppColors.WHITE),
                          onSubmitted: (value) {
                            controller.setIsSearch = false;
                          },
                        ),
                      ),
                    RightButtonsWidget(
                      controller: controller,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
}

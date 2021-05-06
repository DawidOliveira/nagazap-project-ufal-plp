import 'package:flutter/material.dart';
import 'package:nagazap/app/core/app_images.dart';
import 'package:nagazap/app/core/app_text_styles.dart';

class InfoPageWidget extends StatelessWidget {
  const InfoPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.LOGO),
        Text(
          'Bem vindo, faça o login, por gentileza!',
          style: AppTextStyles.COMMON,
        ),
      ],
    );
  }
}

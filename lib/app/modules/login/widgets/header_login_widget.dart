import 'package:flutter/material.dart';
import 'package:nagazap/app/core/app_colors.dart';

class HeaderLoginWidget extends StatelessWidget {
  const HeaderLoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Olá,\nQual seu nome?',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.WHITE,
        fontSize: 24,
      ),
    );
  }
}

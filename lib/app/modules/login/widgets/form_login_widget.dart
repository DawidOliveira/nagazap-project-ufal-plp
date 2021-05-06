import 'package:flutter/material.dart';
import 'package:nagazap/app/core/app_colors.dart';
import 'package:nagazap/app/core/app_text_styles.dart';
import 'package:nagazap/app/modules/login/login_controller.dart';

class FormLoginWidget extends StatelessWidget {
  const FormLoginWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.nameController,
      style: TextStyle(color: AppColors.WHITE),
      autofocus: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textCapitalization: TextCapitalization.words,
      onFieldSubmitted: (value) async {
        if (controller.formKey.currentState!.validate()) {
          await controller.login(context);
        }
      },
      decoration: InputDecoration(
        hintText: 'Digite aqui seu nome...',
        errorStyle: AppTextStyles.ERROR_PURPLE,
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.PURPLE_ERROR,
          ),
        ),
      ),
      validator: (value) {
        if (value!.length < 3) {
          return 'Preencha um nome maior que 3 caracteres';
        }
        return null;
      },
    );
  }
}

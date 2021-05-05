import 'package:flutter/material.dart';
import 'package:nagazap/app/core/app_colors.dart';
import 'package:nagazap/app/modules/login/login_controller.dart';

class LoginPageWidget extends StatelessWidget {
  const LoginPageWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Olá,\nQual seu nome?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.WHITE,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Form(
            key: controller.formKey,
            child: TextFormField(
              controller: controller.nameController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: TextStyle(color: AppColors.WHITE),
              textCapitalization: TextCapitalization.words,
              autofocus: true,
              decoration: InputDecoration(hintText: 'Digite aqui seu nome...'),
              validator: (value) {
                if (value!.length < 3) {
                  return 'Preencha um nome maior que 3 caracteres';
                }
                return null;
              },
            ),
          )
        ],
      ),
    );
  }
}

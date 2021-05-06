import 'package:flutter/material.dart';
import 'package:nagazap/app/modules/login/login_controller.dart';
import 'package:nagazap/app/modules/login/widgets/form_login_widget.dart';
import 'package:nagazap/app/modules/login/widgets/header_login_widget.dart';

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
          HeaderLoginWidget(),
          SizedBox(
            height: 15,
          ),
          Form(
            key: controller.formKey,
            child: FormLoginWidget(controller: controller),
          )
        ],
      ),
    );
  }
}

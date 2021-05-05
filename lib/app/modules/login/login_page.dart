import 'package:flutter/material.dart';
import 'package:nagazap/app/core/app_colors.dart';
import 'package:nagazap/app/modules/login/login_controller.dart';
import 'package:nagazap/app/modules/login/widgets/info_page_widget.dart';
import 'package:nagazap/app/modules/login/widgets/login_page_widget.dart';
import 'package:nagazap/app/repositories/user_repository.dart';
import 'package:nagazap/app/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final controller =
        LoginController(AuthService(context.watch<UserRepository>()));
    return Scaffold(
      backgroundColor: AppColors.PURPLE,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            InfoPageWidget(),
            LoginPageWidget(controller: controller),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: const EdgeInsets.all(20.0),
        child: ValueListenableBuilder(
          valueListenable: controller.isLastPage,
          builder: (context, value, child) => ElevatedButton(
            onPressed: () async {
              if (!controller.isLastPage.value) await controller.nextPage();
              if (controller.formKey.currentState!.validate()) {
                await controller.login(context);
              }
            },
            child: Text(
              controller.isLastPage.value ? 'ENTRAR' : 'LOGIN',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

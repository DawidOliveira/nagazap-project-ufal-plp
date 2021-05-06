import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nagazap/app/core/app_colors.dart';
import 'package:nagazap/app/modules/login/login_controller.dart';
import 'package:nagazap/app/modules/login/widgets/info_page_widget.dart';
import 'package:nagazap/app/modules/login/widgets/login_page_widget.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PURPLE,
      body: SafeArea(
        child: SizedBox(
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

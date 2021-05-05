import 'package:flutter/material.dart';
import 'package:nagazap/app/core/app_route.dart';
import 'package:nagazap/app/services/auth_service.dart';

class LoginController {
  final pageController = PageController();
  final isLastPage = ValueNotifier<bool>(false);
  final formKey = GlobalKey<FormState>();
  final AuthService _authService;
  final nameController = TextEditingController();

  int get page => pageController.page!.toInt();

  LoginController(this._authService);

  Future<void> nextPage() async {
    await pageController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    if (pageController.page == 1) {
      isLastPage.value = true;
    }
  }

  Future<void> login(BuildContext ctx) async {
    if (await _authService.login(name: nameController.text.trim())) {
      Navigator.of(ctx).pushReplacementNamed(Routes.HOME);
    }
  }
}

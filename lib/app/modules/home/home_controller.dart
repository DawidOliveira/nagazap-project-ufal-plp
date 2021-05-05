import 'package:flutter/material.dart';
import 'package:nagazap/app/core/app_route.dart';
import 'package:nagazap/app/repositories/user_repository.dart';
import 'package:nagazap/app/services/auth_service.dart';

class HomeController {
  final isSearch = ValueNotifier<bool>(false);
  final searchName = TextEditingController();
  final UserRepository _userRepository;
  final AuthService _authService;

  HomeController(this._userRepository, this._authService);

  set setIsSearch(bool value) => isSearch.value = value;

  Future logout(BuildContext context) async {
    if (await _authService.logout()) {
      Navigator.of(context).pushReplacementNamed(Routes.LOGIN);
    }
  }
}

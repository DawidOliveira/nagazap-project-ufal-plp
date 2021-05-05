import 'package:flutter/material.dart';
import 'package:nagazap/app/core/app_route.dart';
import 'package:nagazap/app/repositories/user_repository.dart';

class SplashController {
  final UserRepository _userRepository;

  SplashController(BuildContext context, this._userRepository) {
    Future.delayed(Duration(seconds: 1), () async {
      if (await _userRepository.getUser())
        Navigator.of(context).pushReplacementNamed(Routes.HOME);
      else
        Navigator.of(context).pushReplacementNamed(Routes.LOGIN);
    });
  }
}

import 'dart:convert';

import 'package:nagazap/app/repositories/user_repository.dart';
import 'package:nagazap/app/shared/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAuthService {
  Future<bool> login({required String name});
  Future<bool> logout();
}

class AuthService implements IAuthService {
  final UserRepository _userRepository;

  AuthService(this._userRepository);

  @override
  Future<bool> login({required String name}) async {
    try {
      final ps = await SharedPreferences.getInstance();
      ps.setString(
          "user",
          json.encode(
            User(id: name.hashCode.toString(), name: name).toMap(),
          ));
      if (await _userRepository.getUser()) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      final ps = await SharedPreferences.getInstance();
      await ps.remove('user');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

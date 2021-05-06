import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:nagazap/app/repositories/user_repository.dart';
import 'package:nagazap/app/shared/models/user.dart';

abstract class IAuthService {
  Future<bool> login({required String name});
  Future<bool> logout();
}

class AuthService implements IAuthService {
  final UserRepository _userRepository;
  final GetStorage _gs;

  AuthService(this._userRepository, this._gs);

  @override
  Future<bool> login({required String name}) async {
    try {
      await _gs.write(
          "user",
          json.encode(
            User(id: name.hashCode.toString(), name: name).toMap(),
          ));
      if (_userRepository.getUser()) {
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
      await _gs.remove('user');
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

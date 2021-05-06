import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nagazap/app/core/app_route.dart';
import 'package:nagazap/app/repositories/user_repository.dart';
import 'package:nagazap/app/services/auth_service.dart';
import 'package:nagazap/app/services/socket_service.dart';
import 'package:nagazap/app/shared/models/user.dart';

class HomeController extends GetxController {
  final isSearch = ValueNotifier<bool>(false);
  final searchName = TextEditingController();
  final users = ValueNotifier<List<User>>([]);
  final me = ValueNotifier<User?>(null);
  final UserRepository _userRepository;
  final AuthService _authService;
  final SocketService _socketService;

  HomeController(this._userRepository, this._authService, this._socketService);

  @override
  void onInit() {
    super.onInit();
    _socketService.socket!.emit('allUsers');
    _socketService.socket!.on('allUsersBack', (data) {
      users.value = (data as List).map((e) => User.fromMap(e)).toList();
    });
    me.value = _userRepository.user;
  }

  set setIsSearch(bool value) => isSearch.value = value;

  Future logout() async {
    if (await _authService.logout()) {
      Get.offNamed(Routes.LOGIN);
    }
  }
}

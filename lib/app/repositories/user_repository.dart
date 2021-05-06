import 'package:get_storage/get_storage.dart';
import 'package:nagazap/app/shared/models/user.dart';

abstract class IUserRepository {
  bool getUser();
}

class UserRepository implements IUserRepository {
  User? user;
  final GetStorage _gs;

  UserRepository(this._gs) {
    getUser();
  }

  @override
  bool getUser() {
    try {
      user = User.fromJson(_gs.read("user"));
      if (user != null) return true;
      return false;
    } catch (e) {
      return false;
    }
  }
}

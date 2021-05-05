import 'package:nagazap/app/shared/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IUserRepository {
  Future<bool> getUser();
}

class UserRepository implements IUserRepository {
  late User user;

  UserRepository() {
    getUser();
  }

  @override
  Future<bool> getUser() async {
    try {
      final ps = await SharedPreferences.getInstance();
      if (ps.getString("user") == null || ps.getString("user")!.isEmpty) {
        return false;
      } else {
        user = User.fromJson(ps.getString("user")!);
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}

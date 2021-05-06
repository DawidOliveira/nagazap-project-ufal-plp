import 'package:nagazap/app/repositories/user_repository.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  IO.Socket? socket;
  final UserRepository _userRepository;

  SocketService(this._userRepository) {
    init();
  }

  void init() {
    socket = IO.io(
        'https://nagazap-backend.herokuapp.com/',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());
    socket!.connect();
    socket!.onConnect((data) {
      print('conectado');
      socket!.emit('user', _userRepository.user!.toMap());
    });
  }
}

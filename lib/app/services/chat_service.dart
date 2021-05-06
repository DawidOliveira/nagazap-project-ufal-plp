import 'dart:io';

import 'package:nagazap/app/shared/models/message.dart';
import 'package:path_provider/path_provider.dart';

abstract class IChatService {}

class ChatService {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/messages.txt');
  }

  Future<File> saveMessage(Map<String, dynamic> message) async {
    final file = await _localFile;
    final msg = Message.fromMap(message);

    // Write the file.
    return file.writeAsString('${msg.toJson()} ', mode: FileMode.append);
  }
}

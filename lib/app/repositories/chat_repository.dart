import 'dart:convert';
import 'dart:io';

import 'package:nagazap/app/shared/models/message.dart';
import 'package:path_provider/path_provider.dart';

abstract class IChatRepository {}

class ChatRepository {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/messages.txt');
  }

  Future<List<Message>> getMessages() async {
    try {
      final file = await _localFile;

      print((await file.readAsString()).split(' ')
        ..removeWhere((element) => element.isEmpty));
      List<Message> contents = (await file.readAsString())
          .split(' ')
          .map((e) => Message.fromJson(e))
          .toList();
      print(contents);

      return contents;
    } catch (e) {
      return List.empty();
    }
  }
}

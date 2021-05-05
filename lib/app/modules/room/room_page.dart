import 'package:flutter/material.dart';
import 'package:nagazap/app/shared/models/user.dart';

class RoomPage extends StatefulWidget {
  final User user;

  const RoomPage({Key? key, required this.user}) : super(key: key);
  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name),
      ),
    );
  }
}

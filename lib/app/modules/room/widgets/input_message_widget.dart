import 'package:flutter/material.dart';

class InputMessageWidget extends StatelessWidget {
  const InputMessageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        hintText: 'Digite sua mensagem...',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
      ),
      maxLines: 8,
      minLines: 1,
    );
  }
}

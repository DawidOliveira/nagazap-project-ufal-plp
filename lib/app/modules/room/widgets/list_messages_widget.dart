import 'package:flutter/material.dart';

class ListMessagesWidget extends StatelessWidget {
  const ListMessagesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment:
              index % 2 == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              child: Text('oi'),
            )
          ],
        );
      },
    );
  }
}

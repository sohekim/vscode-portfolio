import 'package:flutter/material.dart';

class NotFoundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'NOTFOUND CONTAINER',
          style: TextStyle(fontSize: 150),
        ),
      ],
    );
  }
}

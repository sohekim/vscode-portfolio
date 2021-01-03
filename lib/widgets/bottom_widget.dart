import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
        height: height * 0.04,
        color: Colors.grey[350],
        child: height > 430
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // TODO(Sohee): dummy text
                    children: const [Text('Sohee Porfolio'), Text('made in 2021')]))
            : null);
  }
}

import 'package:flutter/material.dart';

class TabRowWidget extends StatefulWidget {
  @override
  _TabRowWidgetState createState() => _TabRowWidgetState();
}

class _TabRowWidgetState extends State<TabRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
      height: MediaQuery.of(context).size.height * 0.05,
    );
  }
}

import 'package:flutter/material.dart';

class ExplorerWidget extends StatefulWidget {
  @override
  _ExplorerWidgetState createState() => _ExplorerWidgetState();
}

class _ExplorerWidgetState extends State<ExplorerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: MediaQuery.of(context).size.width * 0.2,
    );
  }
}

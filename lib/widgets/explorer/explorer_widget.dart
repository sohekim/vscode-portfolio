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
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [Text('EXPLORER'), Icon(Icons.more_horiz)],
          ),
        ),
        // TODO(Sohee): Add expand list
        const Text('Portfolio'),
        const Text('Intern'),
        const Text('PurpleLabs'),
        const Text('Project Folder'),
        const Text('Project 1'),
        const Text('Project 2')
      ]),
    );
  }
}

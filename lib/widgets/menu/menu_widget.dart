import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: MediaQuery.of(context).size.width * 0.04,
      child: Column(children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.04,
            decoration: const BoxDecoration(border: Border(left: BorderSide(width: 5.0, color: Colors.black))),
            child: selectedPaddingIcon(Icons.file_copy_outlined)),
        paddingIcon(Icons.search_sharp),
        paddingIcon(Icons.apps),
        paddingIcon(Icons.tag_faces_outlined)
      ]),
    );
  }

  Padding paddingIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Icon(
        icon,
        color: Colors.grey[850],
        size: 35.0,
      ),
    );
  }

  Padding selectedPaddingIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Icon(
        icon,
        size: 35.0,
      ),
    );
  }
}

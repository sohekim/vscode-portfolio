import 'package:flutter/material.dart';
import 'package:portfolio/widgets/body_widget.dart';
import 'package:portfolio/widgets/bottom_widget.dart';
import 'package:portfolio/widgets/explorer/explorer_widget.dart';
import 'package:portfolio/widgets/menu/menu_widget.dart';

import 'widgets/bottom_widget.dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.96,
            child: Row(children: [MenuWidget(), ExplorerWidget(), BodyWidget()]),
          ),
          BottomWidget()
        ],
      ),
    );
  }
}

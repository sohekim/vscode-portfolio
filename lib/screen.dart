import 'package:flutter/material.dart';
import 'package:portfolio/widgets/bottom_widget.dart';
import 'package:portfolio/widgets/content/intro_widget.dart';
import 'package:portfolio/widgets/explore/explorer_widget.dart';
import 'package:portfolio/widgets/menu/menu_widget.dart';
import 'package:portfolio/widgets/tab/tab_row_widget.dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.96,
            child: Row(children: [MenuWidget(), ExplorerWidget(), _bodyWidget(context)]),
          ),
          BottomWidget()
        ],
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.76,
      child: Column(children: [TabRowWidget(), IntroWidget()]),
    );
  }
}

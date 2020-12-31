import 'package:flutter/material.dart';
import 'package:portfolio/widgets/content/bridge_widget.dart';
import 'package:portfolio/widgets/content/moim_widget.dart';
import 'package:portfolio/widgets/content/notfound_widget.dart';
import 'package:provider/provider.dart';

import '../screen_provider.dart';
import 'content/intro_widget.dart';
import 'tab/tab_row_widget.dart';

class BodyWidget extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  ScreenProvider screenProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenProvider = Provider.of<ScreenProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.76,
      child: Column(children: [TabRowWidget(), getContentWidget()]),
    );
  }

  Widget getContentWidget() {
    final String selectedTab = screenProvider.selectedTab;
    switch (selectedTab) {
      case 'moim.dart':
        {
          return MoimWidget();
        }
        break;
      case 'main.dart':
        {
          return IntroWidget();
        }
        break;
      case 'bridge.kt':
        {
          return BridgeWidget();
        }
        break;
      default:
        {
          return NotFoundWidget();
        }
        break;
    }
  }
}

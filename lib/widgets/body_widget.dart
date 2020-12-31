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
      width: calculateWidth(),
      child: Column(children: [TabRowWidget(), getContentWidget()]),
    );
  }

  Widget getContentWidget() {
    final String selectedTab = screenProvider.selectedTab;
    switch (selectedTab) {
      case 'moim.dart':
        {
          return IntroWidget();
        }
        break;
      case 'main.dart':
        {
          return IntroWidget();
        }
        break;
      case 'bridge.kt':
        {
          return IntroWidget();
        }
        break;
      default:
        {
          return IntroWidget();
        }
        break;
    }
  }

  double calculateWidth() {
    final double width = MediaQuery.of(context).size.width;
    if (width > 900) {
      return width * 0.76;
    } else if (width > 700) {
      return width * 0.8;
    } else {
      return width;
    }
  }
}

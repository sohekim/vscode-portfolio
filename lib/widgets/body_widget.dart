import 'package:flutter/material.dart';
import 'package:portfolio/widgets/content/bridge_widget.dart';
import 'package:portfolio/widgets/content/intro_widget.dart';
import 'package:portfolio/widgets/content/moim_widget.dart';
import 'package:portfolio/widgets/content/notfound_widget.dart';
import 'package:portfolio/widgets/content/open_body.dart';
import 'package:provider/provider.dart';

import '../screen_provider.dart';
import 'content/bridge_widget.dart';
import 'content/moim_widget.dart';
import 'content/notfound_widget.dart';
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
      child: Column(children: [TabRowWidget(), Expanded(child: getContentWidget())]),
    );
  }

  Widget getContentWidget() {
    final String selectedTab = screenProvider.selectedTab;
    switch (selectedTab) {
      case 'openBody.dart':
        {
          return OpenBodyWidget();
        }
        break;
      case 'moim.dart':
        {
          return MoimWidget();
        }
        break;
      case 'bridge.kt':
        {
          return BridgeWidget();
        }
        break;
      case 'main.dart':
        {
          return IntroWidget();
        }
        break;
      default:
        {
          return NotFoundWidget();
        }
        break;
    }
  }

  double calculateWidth() {
    final double width = MediaQuery.of(context).size.width;
    if (width > 1000) {
      return width * 0.76;
    } else if (width > 900) {
      return width * 0.8;
    } else {
      return width;
    }
  }
}

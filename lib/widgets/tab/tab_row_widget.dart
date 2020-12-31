import 'package:flutter/material.dart';
import 'package:portfolio/widgets/tab/tab_widget.dart';
import 'package:provider/provider.dart';

import '../../screen_provider.dart';

class TabRowWidget extends StatefulWidget {
  @override
  _TabRowWidgetState createState() => _TabRowWidgetState();
}

class _TabRowWidgetState extends State<TabRowWidget> {
  ScreenProvider screenProvider;
  String selectedTab;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenProvider = Provider.of<ScreenProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    selectedTab = screenProvider.selectedTab;
    return Container(color: Colors.indigo, height: 40, child: getTabRow());
  }

  Row getTabRow() {
    final List<Widget> tabRow = [];

    if (screenProvider.openedTab != null && screenProvider.openedTab.contains(screenProvider.selectedTab)) {
      for (final String tab in screenProvider.openedTab) {
        tabRow.add(TabWidget(tab, tab == screenProvider.selectedTab));
      }
    }
    return Row(children: tabRow);
  }
}

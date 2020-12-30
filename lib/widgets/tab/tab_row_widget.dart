import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screen_provider.dart';

class TabRowWidget extends StatefulWidget {
  @override
  _TabRowWidgetState createState() => _TabRowWidgetState();
}

class _TabRowWidgetState extends State<TabRowWidget> {
  ScreenProvider screenProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenProvider = Provider.of<ScreenProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.indigo,
        height: MediaQuery.of(context).size.height * 0.05,
        child: Row(
          children: [
            Text(screenProvider.selectedTab),
          ],
        ));
  }
}

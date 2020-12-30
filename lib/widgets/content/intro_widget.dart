import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screen_provider.dart';

class IntroWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenProvider screenProvider = Provider.of<ScreenProvider>(context, listen: false);

    return Container(
        color: Colors.grey,
        height: MediaQuery.of(context).size.height * 0.91,
        child: Column(
          children: [
            TextButton(
              child: const Text('tab 1'),
              onPressed: () {
                screenProvider.selectedTab = 'tab 1';
              },
            ),
            TextButton(
              child: const Text('tab 2'),
              onPressed: () {
                screenProvider.selectedTab = 'tab 2';
              },
            ),
          ],
        ));
  }
}

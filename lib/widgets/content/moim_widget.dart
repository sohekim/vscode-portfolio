import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screen_provider.dart';

class MoimWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenProvider screenProvider = Provider.of<ScreenProvider>(context, listen: false);

    return Container(
        color: Colors.grey,
        height: MediaQuery.of(context).size.height * 0.91,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'MOIM CONTAINER',
              style: TextStyle(fontSize: 150),
            ),
            TextButton(
              child: const Text('tab 1'),
              onPressed: () {
                screenProvider.selectedTab = screenProvider.tabData['tab 1'];
                final _selectedTab = screenProvider.tabData['tab 1'];
                if (!screenProvider.openedTab.contains(_selectedTab)) {
                  screenProvider.openedTab.add(_selectedTab);
                }
              },
            ),
            TextButton(
              child: const Text('tab 2'),
              onPressed: () {
                screenProvider.selectedTab = screenProvider.tabData['tab 2'];
                final _selectedTab = screenProvider.tabData['tab 2'];
                if (!screenProvider.openedTab.contains(_selectedTab)) {
                  screenProvider.openedTab.add(_selectedTab);
                }
              },
            ),
          ],
        ));
  }
}

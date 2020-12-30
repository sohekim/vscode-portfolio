import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screen_provider.dart';

class TabWidget extends StatelessWidget {
  const TabWidget(this.name, this.isSelected);
  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected ? selectedTab(context) : tab(context);
  }

  Widget selectedTab(BuildContext context) {
    // TODO(Sohee): when too many tabs are opened show as ...
    return Container(
      height: MediaQuery.of(context).size.width * 0.09,
      width: MediaQuery.of(context).size.width * 0.15,
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.ac_unit,
                    color: Colors.white,
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            IconButton(
                icon: Icon(
                  Icons.cancel_outlined,
                  color: Colors.white,
                ),
                onPressed: () => closeTab(context))
          ],
        ),
      ),
    );
  }

  void closeTab(BuildContext context) {
    final ScreenProvider screenProvider = Provider.of<ScreenProvider>(context, listen: false);
    screenProvider.openedTab.remove(name);
    if (screenProvider.openedTab.isNotEmpty) {
      screenProvider.selectedTab = screenProvider.openedTab.last;
    } else {
      screenProvider.selectedTab = '';
    }
  }

  Widget tab(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.09,
      width: MediaQuery.of(context).size.width * 0.15,
      color: Colors.grey[350],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.ac_unit,
                color: Colors.grey,
              ),
            ),
            Text(name, style: TextStyle(color: Colors.grey))
          ],
        ),
      ),
    );
  }
}

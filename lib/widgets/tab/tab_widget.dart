import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screen_provider.dart';

class TabWidget extends StatelessWidget {
  const TabWidget(this.name, this.isSelected);
  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final ScreenProvider screenProvider = Provider.of<ScreenProvider>(context, listen: false);

    return isSelected ? selectedTab(context, screenProvider) : tab(context, screenProvider);
  }

  Widget iconTab(IconData iconData, Color bgColor, Color iconColor) {
    return Container(
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Icon(
          iconData,
          color: iconColor,
        ),
      ),
    );
  }

  Widget selectedTab(BuildContext context, ScreenProvider screenProvider) {
    final Size size = MediaQuery.of(context).size;
    final bool isOverflow = screenProvider.openedTab.length * 160 > size.width;
    return isOverflow
        ? iconTab(Icons.ac_unit, Colors.black, Colors.white)
        : Container(
          height: 45,
            width: size.width > 1100 ? size.width * 0.15 : 160,
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                       Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        // TODO(Sohee): show different icon by language
                        child: Icon(
                          Icons.ac_unit,
                          color: Colors.grey[900],
                        ),
                      ),
                      Text(
                        name,
                        style: TextStyle(color: Colors.grey[900]),
                      ),
                    ],
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: Colors.grey[900],
                      ),
                      onPressed: () => closeTab(context, screenProvider))
                ],
              ),
            ),
          );
  }

  void closeTab(BuildContext context, ScreenProvider screenProvider) {
    screenProvider.openedTab.remove(name);
    if (screenProvider.openedTab.isNotEmpty) {
      screenProvider.selectedTab = screenProvider.openedTab.last;
    } else {
      screenProvider.selectedTab = '';
    }
  }

  Widget tab(BuildContext context, ScreenProvider screenProvider) {
    final Size size = MediaQuery.of(context).size;
    final bool isOverflow = screenProvider.openedTab.length * 160 > size.width;

    return InkWell(
      onTap: () => {screenProvider.selectedTab = name},
      child: isOverflow
          // TODO(Sohee): text icon tab
          ? iconTab(Icons.ac_unit, Colors.grey[100], Colors.grey)
          : Container(
              height: 45,
              width: size.width > 1100 ? size.width * 0.15 : 160,
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.ac_unit,
                        color: Colors.grey,
                      ),
                    ),
                    Text(name, style: const TextStyle(color: Colors.grey))
                  ],
                ),
              ),
            ),
    );
  }
}

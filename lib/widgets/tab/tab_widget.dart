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

  Widget iconTab(double height, IconData iconData, Color bgColor, Color iconColor) {
    return Container(
      height: height,
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
    return size.width < 1100 || isOverflow
        ? iconTab(size.height, Icons.ac_unit, Colors.black, Colors.white)
        : Container(
            height: size.width * 0.09,
            width: size.width * 0.15,
            color: Colors.grey[900],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        // TODO(Sohee): show different icon by language
                        child: Icon(
                          Icons.ac_unit,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        name,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  IconButton(
                      icon: const Icon(
                        Icons.cancel_outlined,
                        color: Colors.white,
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
      child: size.width < 1100 || isOverflow
          ? iconTab(size.height, Icons.ac_unit, Colors.grey[350], Colors.grey)
          : Container(
              height: size.width * 0.09,
              width: size.width * 0.15,
              color: Colors.grey[350],
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

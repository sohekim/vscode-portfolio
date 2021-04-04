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
        ? getIcon(name)
        : Container(
            height: 45,
            width: size.width > 1100 ? size.width * 0.15 : 160,
            color: Colors.grey[50],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          // TODO(Sohee): show different icon by language
                          child: getIcon(name)),
                      Text(
                        name,
                        style: TextStyle(color: Colors.grey[900]),
                      ),
                    ],
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: Colors.grey[800],
                      ),
                      onPressed: () => closeTab(context, screenProvider))
                ],
              ),
            ),
          );
  }

  Widget getIcon(String name) {
    if (name == null) {
      return Icon(
        Icons.ac_unit,
        color: Colors.grey[900],
      );
    }
    if (name.endsWith('dart')) {
      return Image.asset(
        'images/dart.png',
        height: 25,
        width: 25,
        fit: BoxFit.contain,
      );
    } else if (name.endsWith('kt')) {
      return Image.asset(
        'images/kotlin.png',
        height: 20,
        width: 20,
        fit: BoxFit.contain,
      );
    } else if (name.endsWith('java')) {
      return Image.asset(
        'images/java.png',
        height: 25,
        width: 25,
        fit: BoxFit.contain,
      );
    } else {
      return Icon(
        Icons.ac_unit,
        color: Colors.grey[900],
      );
    }
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
          ? getIcon(name)
          : Container(
              height: 45,
              width: size.width > 1100 ? size.width * 0.15 : 160,
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: getIcon(name),
                    ),
                    Text(name, style: TextStyle(color: Colors.grey[350]))
                  ],
                ),
              ),
            ),
    );
  }
}

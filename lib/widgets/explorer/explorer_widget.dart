import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screen_provider.dart';

class ExplorerWidget extends StatefulWidget {
  @override
  _ExplorerWidgetState createState() => _ExplorerWidgetState();
}

class _ExplorerWidgetState extends State<ExplorerWidget> {
  ScreenProvider screenProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenProvider = Provider.of<ScreenProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = MediaQuery.of(context).size.width > 900;

    return isLargeScreen
        ? Container(
            color: Colors.grey[300],
            width: MediaQuery.of(context).size.width * 0.2,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'EXPLORER',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.more_horiz)
                  ],
                ),
              ),
              ExpansionTile(
                  title: const Text(
                    'PORTFOLIO',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  tilePadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  initiallyExpanded: true,
                  children: <Widget>[
                    // ExpansionTile(
                    //     title: titleItem(Icons.folder_outlined, 'Experience'),
                    //     tilePadding: const EdgeInsets.symmetric(horizontal: 20.0),
                    //     childrenPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                    //     children: <Widget>[
                    //       tileItem(Icons.ac_unit, 'purpleLabs.intern'),
                    //       tileItem(Icons.ac_unit, 'DataStructure.TA')
                    //     ]),
                    ExpansionTile(
                        title: titleItem(Icons.folder_outlined, 'Projects'),
                        tilePadding: const EdgeInsets.symmetric(horizontal: 20.0),
                        childrenPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                        initiallyExpanded: true,
                        children: <Widget>[tileItem(Icons.ac_unit, 'moim.dart'), tileItem(Icons.ac_unit, 'bridge.kt')]),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: tileItem(Icons.ac_unit, 'main.dart'),
                    ),
                  ]),
            ]),
          )
        : const SizedBox.shrink();
  }

  Widget tileItem(IconData iconData, String title) {
    final bool isOpened = title == screenProvider.selectedTab;
    return InkWell(
      onTap: () {
        screenProvider.selectedTab = title;
        final _selectedTab = title;
        if (!screenProvider.openedTab.contains(_selectedTab)) {
          screenProvider.openedTab.add(_selectedTab);
        }
      },
      child: Row(children: [
        Icon(
          iconData,
          color: isOpened ? Colors.black : Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 0, 10),
          child: Text(
            title,
            style: TextStyle(
              color: isOpened ? Colors.black : Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
      ]),
    );
  }

  Widget titleItem(IconData iconData, String title) {
    return Row(children: [
      Icon(iconData),
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 10, 0, 10),
        child: Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
      ),
    ]);
  }
}

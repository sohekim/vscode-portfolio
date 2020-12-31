import 'package:flutter/material.dart';

class ScreenProvider with ChangeNotifier {
  String _selectedMenu = 'file';
  String _selectedTab = 'main.dart';
  List<String> openedTab = ['main.dart'];

  final Map<String, String> tabData = {'main': 'main.dart', 'tab 1': 'moim.dart', 'tab 2': 'bridge.kt'};

  set selectedTab(String newTab) {
    _selectedTab = newTab;
    notifyListeners();
  }

  String get selectedTab => _selectedTab;

  set selectedMenu(String newMenu) {
    _selectedMenu = newMenu;
    notifyListeners();
  }

  String get selectedMenu => _selectedMenu;
}

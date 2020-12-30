import 'package:flutter/material.dart';
import 'package:portfolio/screen.dart';
import 'package:portfolio/screen_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sohee Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ScreenProvider>(
      create: (_) => ScreenProvider(),
      child: Screen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        accentColor: Colors.black,
        textTheme: TextTheme(
          bodyText1: GoogleFonts.robotoMono(
            fontSize: 15,
          ),
        ),
      ),
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

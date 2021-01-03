import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/screen_provider.dart';
import 'package:provider/provider.dart';

class OpenBodyWidget extends StatefulWidget {
  @override
  _OpenBodyWidgetState createState() => _OpenBodyWidgetState();
}

class _OpenBodyWidgetState extends State<OpenBodyWidget> with TickerProviderStateMixin {
  AlignmentDirectional _widgetAlignment = AlignmentDirectional(0, -5);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 1), () {
        _downWidget();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final ScreenProvider screenProvider = Provider.of<ScreenProvider>(context, listen: false);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      alignment: _widgetAlignment,
      child: Container(
          height: MediaQuery.of(context).size.height * 0.45 + 80,
          width: 700,
          child: Container(
            color: Colors.white,
            width: 700,
            child: Column(
              children: [
                _topBar(),
                Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[_leftRow(), _rightRow()])),
                _bottomRow(screenProvider)
              ],
            ),
          )),
    );
  }

  Widget _topBar() {
    return Container(
        color: Colors.grey,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                  ),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: _roundedContainer(context, iconText(Icons.search, 'Search'), Colors.white),
            ),
          ],
        ));
  }

  Widget _leftRow() {
    return Container(
      decoration:
          BoxDecoration(color: Colors.grey[50], border: Border.symmetric(vertical: BorderSide(color: Colors.grey))
              // border: Border(right: BorderSide(color: Colors.grey[400])),
              ),
      width: 230,
      height: MediaQuery.of(context).size.height * 0.45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
            onPressed: () {},
            color: Colors.grey[300],
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 5, 8.0, 0),
                    child: Padding(padding: const EdgeInsets.only(bottom: 4.0), child: Icon(Icons.folder_outlined)),
                  ),
                  Text(
                    'Sohee_Kim_Portfolio',
                  ),
                ],
              ),
              Icon(Icons.navigate_next)
            ]),
          ),
        ],
      ),
    );
  }

  Widget _rightRow() {
    return Container(
        decoration: BoxDecoration(color: Colors.grey[50], border: Border(right: BorderSide(color: Colors.grey))),
        width: 470,
        height: MediaQuery.of(context).size.height * 0.45,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Wrap(direction: Axis.horizontal, children: [
            Align(
              alignment: Alignment.center,
              // child: Icon(
              //   Icons.tab,
              //   size: 150,
              // ),
              child: Image.asset('images/blank.png', fit: BoxFit.fill, width: 140, height: 170),
            ),
            Text(
              '\nSohee Kim Porfolio Website',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              'VS Code inspired Flutter Web',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            Divider(
              color: Colors.black,
            ),
            Text(
              'Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Instruction',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                'Please click open to enter the website',
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Author',
                style: TextStyle(color: Colors.grey),
              ),
              Text('Sohee Kim')
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'created',
                style: TextStyle(color: Colors.grey),
              ),
              Text('Jan 1, 2021')
            ]),
          ]),
        ));
  }

  Widget _bottomRow(ScreenProvider screenProvider) {
    return Container(
        color: Colors.grey,
        height: 40,
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: FlatButton(
              onPressed: () {
                _upWidget();
                Timer(const Duration(milliseconds: 500), () {
                  final _selectedTab = screenProvider.tabData['main'];
                  screenProvider.selectedTab = _selectedTab;
                  if (!screenProvider.openedTab.contains(_selectedTab)) {
                    screenProvider.openedTab.add(_selectedTab);
                  }
                });
              },
              child: Text(
                'Open',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Colors.blue,
            ),
          ),
        ]));
  }

  Widget _roundedContainer(BuildContext context, Widget widget, Color color) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(2)), color: color),
        width: MediaQuery.of(context).size.width * 0.13,
        child: widget,
      ),
    );
  }

  Widget iconText(IconData iconData, String text) {
    return Padding(
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 3.0),
              child: Icon(
                iconData,
                size: 20,
              ),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        padding: EdgeInsets.all(7));
  }

  void _downWidget() {
    setState(() {
      _widgetAlignment = AlignmentDirectional(0, -1.3);
      ;
    });
  }

  void _upWidget() {
    setState(() {
      _widgetAlignment = AlignmentDirectional(0, -5);
      ;
    });
  }
}

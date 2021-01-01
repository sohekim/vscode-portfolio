import 'package:flutter/material.dart';
import 'package:portfolio/screen_provider.dart';
import 'package:provider/provider.dart';

class FinderWidget extends StatelessWidget {
  Widget _arrows() {
    return Row(
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
    );
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

  @override
  Widget build(BuildContext context) {
    final ScreenProvider screenProvider = Provider.of<ScreenProvider>(context, listen: false);

    return Container(
      color: Colors.white,
      width: 700,
      child: Column(
        children: [
          Container(
              color: Colors.grey[600],
              height: 40,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                _arrows(),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: _roundedContainer(context, iconText(Icons.search, 'Search'), Colors.white),
                ),
              ])),
          Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.45,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[50],
                          border: Border.symmetric(vertical: BorderSide(color: Colors.grey[600]))
                          // border: Border(right: BorderSide(color: Colors.grey[400])),
                          ),
                      width: 230,
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                            onPressed: () {},
                            color: Colors.blue,
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 5, 8.0, 0),
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 4.0),
                                      child: Icon(
                                        Icons.folder,
                                      ),
                                    ),
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
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[50], border: Border(right: BorderSide(color: Colors.grey[600]))
                            // border: Border(right: BorderSide(color: Colors.grey[400])),
                            ),
                        width: 470,
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.file_copy_outlined,
                                size: 150,
                              ),
                            ),
                            Text(
                              'Sohee Kim Porfolio Website',
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
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                              Text(
                                'Instruction',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text('Please click open to enter the website')
                            ]),
                          ]),
                        )),
                  ])),
          Container(
              color: Colors.grey[600],
              height: 40,
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: FlatButton(
                    onPressed: () {
                      final _selectedTab = screenProvider.tabData['main'];
                      screenProvider.selectedTab = _selectedTab;
                      if (!screenProvider.openedTab.contains(_selectedTab)) {
                        screenProvider.openedTab.add(_selectedTab);
                      }
                    },
                    child: Text('Open'),
                    color: Colors.blue,
                  ),
                ),
              ]))
        ],
      ),
    );
  }
}

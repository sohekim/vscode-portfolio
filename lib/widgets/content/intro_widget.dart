import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screen_provider.dart';

// TODO(Sohee): use text theme
class IntroWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenProvider screenProvider = Provider.of<ScreenProvider>(context, listen: false);
    return SingleChildScrollView(
      
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 100),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              // add constructor
              RichText(
                  text: TextSpan(style: Theme.of(context).textTheme.bodyText1, children: [
                TextSpan(
                    text: '\nClass AboutSohee',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.orange, fontWeight: FontWeight.bold)),
                // TextSpan(
                //   text: ' AboutSohee',
                //   style: Theme.of(context).textTheme.bodyText1,
                // ),
                TextSpan(
                    text: ' {\n',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.orange, fontWeight: FontWeight.bold)),
              ])),

              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText1,
                      children: <TextSpan>[
                        TextSpan(
                          text: '\nlooking for 2021 Internship',
                        ),
                        TextSpan(
                            text: ' = true\n',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Colors.orange, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '\nmyStatus = ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Colors.orange, fontWeight: FontWeight.bold)),
                        TextSpan(text: 'Full-Stack Intern at PurpleLabs'),
                        TextSpan(
                            text: '\nmyEducation = {',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Colors.orange, fontWeight: FontWeight.bold)),
                        TextSpan(text: ' Mount Holyoke College, Sophomore '),
                        TextSpan(
                            text: '}\nmyMajor = ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Colors.orange, fontWeight: FontWeight.bold)),
                        TextSpan(text: 'Computer Science && Philosophy'),
                        TextSpan(
                            text: '\n\n\nmySkills = {',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Colors.orange, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(
                        'language : [Dart, Java, Kotlin, Python, HTML/CSS],',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      // change to framework
                      Text(
                        'SDK : [Flutter, Android Studio, Xcode],',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        'tools : [Github, Google Firebase/Crashlytics, AWS CloudWatch, Postman, Bitrise]',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ]),
                  ),
                  Text(
                    '}\n\n',
                    style:
                        Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.orange, fontWeight: FontWeight.bold),
                  ),
                  getProjectRow(screenProvider, context, true, [
                    'Portfolio Website',
                    'Moim',
                    'BreastCancer Cancer Classification',
                  ]),
                  getProjectRow(screenProvider, context, false,
                      ['Bridge', 'Not Again', 'CoolFunAmazingGame', 'Poop-Di-Scoop', 'Moodify']),
                  Text(
                    '\n\nmyExperience = {',
                    style:
                        Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.orange, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      experienceRow(context, '\nPurpleLabs', 'Full-Stack Developer', 'Jul 5050 - Present'),
                      experienceRow(context, '\nGoogle', 'J-Term Coding Bootcamp', 'Dec 5019 - Jan 5050'),
                      experienceRow(
                          context, '\nMount Holyoke College', 'Data Structure(CS 505) T.A', 'Jun 5019 - Jul 5050'),
                      experienceRow(context, '\nDavidson College', 'Summer Coding Bootcamp', 'Jun 5019 - Jul 5050'),
                      experienceRow(
                          context, '\nMount Holyoke College', 'HackHolyoke Head of Logistics', 'Jun 5019 - Jul 5050'),
                      experienceRow(
                          context, '\nMount Holyoke College', 'CS Society Head Web Developer', 'Jun 5019 - Jul 5050'),
                    ]),
                  ),
                  Text(
                    '\n}',
                    style:
                        Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.orange, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              Text(
                '}\n',
                style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.orange, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget experienceRow(BuildContext context, String title, String position, String date) {
    return Padding(
      padding: const EdgeInsets.only(right: 350.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              position,
              style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey[600]),
            )
          ]),
          Text(
            date,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }

  Widget getProjectRow(ScreenProvider screenProvider, BuildContext context, bool isFirst, List<String> _projects) {
    List<Widget> _row = [];
    if (isFirst) {
      _row.add(Text('myProjects = [',
          style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.orange, fontWeight: FontWeight.bold)));
    }
    for (final String project in _projects) {
      _row.add(InkWell(
        onTap: () {
          updateTab(screenProvider, project);
        },
        hoverColor: Colors.orange[100],
        child: Text(
          project,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ));
      _row.add(Text(
        ', ',
        style: Theme.of(context).textTheme.bodyText1,
      ));
    }

    if (!isFirst) {
      _row[9] = (Text(
        ']',
        style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.orange),
      ));
      return Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Wrap(
          children: _row,
        ),
      );
    } else {
      return Wrap(
        children: _row,
      );
    }
  }

  void updateTab(ScreenProvider screenProvider, String tabName) {
    screenProvider.selectedTab = screenProvider.tabData[tabName];
    final _selectedTab = screenProvider.tabData[tabName];
    if (!screenProvider.openedTab.contains(_selectedTab)) {
      screenProvider.openedTab.add(_selectedTab);
    }
  }
}

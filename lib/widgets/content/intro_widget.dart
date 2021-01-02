import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screen_provider.dart';

// TODO(Sohee): use text theme
class IntroWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenProvider screenProvider = Provider.of<ScreenProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 100),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          // add constructor
          Text(
            '\nClass AboutSohee {\n',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'looking for 2021 Internship = true\n',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'myStatus = Full-Stack Intern at PurpleLabs',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'myEducation = {Mount Holyoke College, Sophomore}\nmyMajor = Computer Science && Philosophy',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                '\nmySkills = {',
                style: Theme.of(context).textTheme.bodyText1,
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
                '}\n',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              getProjectRow(context, true, [
                'Portfolio Website',
                'Moim',
                'BreastCancer Cancer Classification',
              ]),
              getProjectRow(context, false, ['Bridge', 'Not Again', 'CoolFunAmazingGame', 'Poop-Di-Scoop', 'Moodify']),
              Text(
                '\nmyExperience = {',
                style: Theme.of(context).textTheme.bodyText1,
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
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ]),
          ),
          Text(
            '}\n',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ]),
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
              style: Theme.of(context).textTheme.bodyText1,
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

  Widget getProjectRow(BuildContext context, bool isFirst, List<String> _projects) {
    List<Widget> _row = [];
    if (isFirst) {
      _row.add(Text(
        'myProjects = [',
        style: Theme.of(context).textTheme.bodyText1,
      ));
    }
    for (final String project in _projects) {
      _row.add(InkWell(
        onTap: () {},
        hoverColor: Colors.orange[300],
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
        style: Theme.of(context).textTheme.bodyText1,
      ));
      return Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Row(
          children: _row,
        ),
      );
    } else {
      return Row(
        children: _row,
      );
    }
  }

  Widget getProjectSecondRow(BuildContext context) {
    List<Widget> _row = [];

    List<String> _projects = ['Bridge', 'Not Again', 'CoolFunAmazingGame', 'Poop-Di-Scoop', 'Moodify'];
    for (String project in _projects) {
      _row.add(InkWell(
        onTap: () {},
        hoverColor: Colors.orange,
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

    _row[9] = (Text(
      ']',
      style: Theme.of(context).textTheme.bodyText1,
    ));

    return Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: Row(
        children: _row,
      ),
    );
  }

  void updateTab(ScreenProvider screenProvider, String tabName) {
    screenProvider.selectedTab = screenProvider.tabData[tabName];
    final _selectedTab = screenProvider.tabData[tabName];
    if (!screenProvider.openedTab.contains(_selectedTab)) {
      screenProvider.openedTab.add(_selectedTab);
    }
  }
}

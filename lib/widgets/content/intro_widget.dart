import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screen_provider.dart';

// TODO(Sohee): use text theme
class IntroWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenProvider screenProvider = Provider.of<ScreenProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
        // Text(
        //   "//* Copyright 2021 Sohee Kim. All rights reserved.\nI'm Sohee Kim, a design-minded front-end software engineer \nfocused on building beautiful interfaces & experiences *//\n",
        //   style: Theme.of(context).textTheme.bodyText1,
        // ),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(text: 'public ', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.blue)),
              TextSpan(text: 'class ', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.amber)),
              TextSpan(
                  text: 'IntroduceMyself ',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.indigo)),
              TextSpan(text: '{ ', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.blue)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: '\nSoftwareEngineer ',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.blue)),
                TextSpan(text: 'Sohee ', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.amber)),
                TextSpan(text: '= ', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.indigo)),
                TextSpan(text: 'new ', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.blue)),
                TextSpan(
                    text: 'SoftwareEngineer ',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.blue)),
                TextSpan(text: '()', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.amber)),
                TextSpan(text: ';', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black)),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: '\nSohee', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.blue)),
                TextSpan(text: '.', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.amber)),
                TextSpan(
                    text: 'takingYearOffToWork',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.amber)),
                TextSpan(text: '(', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.amber)),
                TextSpan(text: 'true', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.blue)),
                TextSpan(text: ')', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.amber)),
                TextSpan(text: ';', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black)),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: '\nSohee', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.blue)),
                TextSpan(text: '.', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.amber)),
                TextSpan(text: 'education', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.amber)),
                TextSpan(text: '(', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.amber)),
                TextSpan(
                    text: 'Mount Holyoke College',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.blue)),
                TextSpan(text: ',', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.amber)),
                TextSpan(
                    text: ' Sophomore', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.green)),
                TextSpan(text: ')', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.brown)),
                TextSpan(text: ';', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black)),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(text: 'Sohee', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.blue)),
                TextSpan(text: '.', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.amber)),
                TextSpan(text: 'intern', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.amber)),
                TextSpan(text: '(', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.amber)),
                TextSpan(text: 'PurpleLabs', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.blue)),
                TextSpan(text: ')', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.amber)),
                TextSpan(text: ';', style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black)),
              ],
            ),
          ),
        ),
      ]),
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

// class IntroduceMyself {

//   SoftwareEngineer Sohee = SoftwareEnginner();

//   // if needed, comment out -> write introduction

//   Sohee.intern(PurpleLabs, Seoul);
//   // currently taking a year off for my internship
//   Sohee.student(MountHolyokeCollege, Sophomore, ComputerScience && Philosophy Major);
//   Sohee.lookingForSummer2022InternShip(true);

//   // skill Set
//   // experience
//   // portfolio
//   // menu -- connect with LinkedIn

//   Sohee.skillSet = {
//     Dart : intermediate,
//     Java : intermediate,
//     Python :
//   }

//   Sohee.interested = {
//     cleanArchitecture
//   }

// SkillSet
// Projects

// }

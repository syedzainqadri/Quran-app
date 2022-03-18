import 'package:flutter/material.dart';
import 'package:quranapp/Screens/sunnahScreens/tabsScreen.dart';
import 'package:quranapp/Widgets/customCard.dart';

final List<Widget> sunnahList = [
  Custom_Card(
    screenName: TabSceern(
      title: 'Bismillah Sunnah',
    ),
    imagePath: 'assets/images/muslim.png',
    title: 'Bismillah Sunnah',
  ),
  Custom_Card(
    imagePath: 'assets/images/sleep.png',
    title: 'Sleeping Sunnah',
  ),
  Custom_Card(
    imagePath: 'assets/images/sleep.png',
    title: 'Sleeping Sunnah',
  ),
  Custom_Card(
    imagePath: 'assets/images/eating.png',
    title: 'Eating Sunnah',
  ),
  Custom_Card(
    imagePath: 'assets/images/miswak.png',
    title: 'Miswak Sunnah',
  ),
];

import 'package:flutter/material.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/makharajScreen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/qaidaLessons.dart';
import 'package:quranapp/Widgets/customCard.dart';

final List<Widget> learnQaidaScreenList = [
  Custom_Card(
    screenName: QaidaLessons(),
    imagePath: 'assets/images/qurancolor.png',
    title: 'Madani Qaida',
  ),
  Custom_Card(
    imagePath: 'assets/images/instructions.png',
    title: 'Instructions',
  ),
  Custom_Card(
    imagePath: 'assets/images/articulator.png',
    title: 'Makharaj',
    screenName: MakharajScreen(),
  ),
  Custom_Card(
    imagePath: 'assets/images/notes.png',
    title: 'Important Notes',
  ),
  Custom_Card(
    imagePath: 'assets/images/question.png',
    title: 'Question & Answer',
  ),
];

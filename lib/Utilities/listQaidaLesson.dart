import 'package:flutter/material.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson01Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson02Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson03Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson04Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson05Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson06Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson07Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson08Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson09Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson10Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson11Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson12Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson13Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson14Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson15Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson16Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson17Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson18Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson19Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson20Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson21Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson22Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson23Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson24Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson25Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson26Screen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/Lesson27Screen.dart';
import 'package:quranapp/Utilities/LessonsContentList/listLesson01.dart';
import 'package:quranapp/Widgets/CustomLessonListTile.dart';

final List<Widget> qaidaLessons = [
  CustomLessonListTile(
    screenName: Lesson01Screen(lessonModel: lessonDetails.first),
    lessonNo: '01',
    lessonNoU: '۱',
  ),
  CustomLessonListTile(
    screenName: Lesson02Screen(), // 02 to 01 for testing
    lessonNo: '02',
    lessonNoU: '۲',
  ),
  CustomLessonListTile(
    screenName: Lesson03Screen(lessonModel: lessonDetails[2]),
    lessonNo: '03',
    lessonNoU: '۳',
  ),
  CustomLessonListTile(
    screenName: Lesson04Screen(lessonModel: lessonDetails[3]),
    lessonNo: '04',
    lessonNoU: '۴',
  ),
  CustomLessonListTile(
    screenName: Lesson05Screen(lessonModel: lessonDetails[4]),
    lessonNo: '05',
    lessonNoU: '۵',
  ),
  CustomLessonListTile(
    screenName: Lesson06Screen(lessonModel: lessonDetails[5]),
    lessonNo: '06',
    lessonNoU: '۶',
  ),
  CustomLessonListTile(
    screenName: Lesson07Screen(lessonModel: lessonDetails[6]),
    lessonNo: '07',
    lessonNoU: '۷',
  ),
  CustomLessonListTile(
    screenName: Lesson08Screen(lessonModel: lessonDetails[7]),
    lessonNo: '08',
    lessonNoU: '۸',
  ),
  CustomLessonListTile(
    screenName: Lesson09Screen(lessonModel: lessonDetails[8]),
    lessonNo: '09',
    lessonNoU: '۹',
  ),
  CustomLessonListTile(
    screenName: Lesson10Screen(),
    lessonNo: '10',
    lessonNoU: '۱۰',
  ),
  CustomLessonListTile(
    screenName: Lesson11Screen(),
    lessonNo: '11',
    lessonNoU: '۱۱',
  ),
  CustomLessonListTile(
    screenName: Lesson12Screen(),
    lessonNo: '12',
    lessonNoU: '۱۲',
  ),
  CustomLessonListTile(
    screenName: Lesson13Screen(),
    lessonNo: '13',
    lessonNoU: '۱۳',
  ),
  CustomLessonListTile(
    screenName: Lesson14Screen(),
    lessonNo: '14',
    lessonNoU: '۱۴',
  ),
  CustomLessonListTile(
    screenName: Lesson15Screen(),
    lessonNo: '15',
    lessonNoU: '۱۵',
  ),
  CustomLessonListTile(
    screenName: Lesson16Screen(),
    lessonNo: '16',
    lessonNoU: '۱۶',
  ),
  CustomLessonListTile(
    screenName: Lesson17Screen(),
    lessonNo: '17',
    lessonNoU: '۱۷',
  ),
  CustomLessonListTile(
    screenName: Lesson18Screen(),
    lessonNo: '18',
    lessonNoU: '۱۸',
  ),
  CustomLessonListTile(
    screenName: Lesson19Screen(),
    lessonNo: '19',
    lessonNoU: '۱۹',
  ),
  CustomLessonListTile(
    screenName: Lesson20Screen(),
    lessonNo: '20',
    lessonNoU: '۲۰',
  ),
  CustomLessonListTile(
    screenName: Lesson21Screen(),
    lessonNo: '21',
    lessonNoU: '۲۱',
  ),
  CustomLessonListTile(
    screenName: Lesson22Screen(),
    lessonNo: '22',
    lessonNoU: '۲۲',
  ),
  CustomLessonListTile(
    screenName: Lesson23Screen(),
    lessonNo: '23',
    lessonNoU: '۲۳',
  ),
  CustomLessonListTile(
    screenName: Lesson24Screen(),
    lessonNo: '24',
    lessonNoU: '۲۴',
  ),
  CustomLessonListTile(
    screenName: Lesson25Screen(),
    lessonNo: '25',
    lessonNoU: '۲۵',
  ),
  CustomLessonListTile(
    screenName: Lesson26Screen(),
    lessonNo: '26',
    lessonNoU: '۲٦',
  ),
  CustomLessonListTile(
    screenName: Lesson27Screen(),
    lessonNo: '27',
    lessonNoU: '۲۷',
  ),
];

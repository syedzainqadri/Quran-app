import 'package:flutter/material.dart';
import 'package:quranapp/Model/sub_list.dart';

class LessonModel {
  String lessonNo;
  String title_eng;
  String title_ar;
  List item_list;
  List instructions;
  LessonModel({
    @required this.lessonNo,
    @required this.title_eng,
    @required this.title_ar,
    @required this.item_list,
    @required this.instructions,
  });
}



// final List<Widget> listLessonOne = [
//   CustomWordCard(
//     word: 'ا',
//     subWord: 'آلِفُ',
//     soundPath: 'sounds/Lesson01/L11.wav',
//   ),
//   CustomWordCard(
//     word: 'ب',
//     subWord: 'بَا',
//     soundPath: 'sounds/Lesson01/L12.wav',
//   ),
//   CustomWordCard(
//     word: 'ت',
//     subWord: 'تَا',
//     soundPath: 'sounds/Lesson01/L13.wav',
//   ),
//   CustomWordCard(
//     word: 'ث',
//     subWord: 'ثَا',
//     soundPath: 'sounds/Lesson01/L14.wav',
//   ),
//   CustomWordCard(
//     word: 'ج',
//     subWord: 'جِيُمُ',
//     soundPath: 'sounds/Lesson01/L15.wav',
//   ),
//   CustomWordCard(
//     word: 'ح',
//     subWord: 'حَا',
//     soundPath: 'sounds/Lesson01/L16.wav',
//   ),
//   CustomWordCard(
//     word: 'خ',
//     subWord: 'خَا',
//     soundPath: 'sounds/Lesson01/L17.wav',
//   ),
//   CustomWordCard(
//     word: 'د',
//     subWord: 'دَالُ',
//     soundPath: 'sounds/Lesson01/L18.wav',
//   ),
//   CustomWordCard(
//     word: 'ذ',
//     subWord: 'ذَالُ',
//     soundPath: 'sounds/Lesson01/L19.wav',
//   ),
//   CustomWordCard(
//     word: 'ر',
//     subWord: 'رَا',
//     soundPath: 'sounds/Lesson01/L110.wav',
//   ),
//   CustomWordCard(
//     word: 'ز',
//     subWord: 'زَا',
//     soundPath: 'sounds/Lesson01/L111.wav',
//   ),
//   CustomWordCard(
//     word: 'س',
//     subWord: 'سيُنُ',
//     soundPath: 'sounds/Lesson01/L112.wav',
//   ),
//   CustomWordCard(
//     word: 'ش',
//     subWord: 'شيُنُ',
//     soundPath: 'sounds/Lesson01/L113.wav',
//   ),
//   CustomWordCard(
//     word: 'ص',
//     subWord: 'صَادُ',
//     soundPath: 'sounds/Lesson01/L114.wav',
//   ),
//   CustomWordCard(
//     word: 'ض',
//     subWord: 'ضَادُ',
//     soundPath: 'sounds/Lesson01/L115.wav',
//   ),
//   CustomWordCard(
//     word: 'ط',
//     subWord: 'طَا',
//     soundPath: 'sounds/Lesson01/L116.wav',
//   ),
//   CustomWordCard(
//     word: 'ظ',
//     subWord: 'ظَا',
//     soundPath: 'sounds/Lesson01/L117.wav',
//   ),
//   CustomWordCard(
//     word: 'ع',
//     subWord: 'عَيُنُ',
//     soundPath: 'sounds/Lesson01/L118.wav',
//   ),
//   CustomWordCard(
//     word: 'غ',
//     subWord: 'غَيُنُ',
//     soundPath: 'sounds/Lesson01/L119.wav',
//   ),
//   CustomWordCard(
//     word: 'ف',
//     subWord: 'فَا',
//     soundPath: 'sounds/Lesson01/L120.wav',
//   ),
//   CustomWordCard(
//     word: 'ق',
//     subWord: 'قَافُ',
//     soundPath: 'sounds/Lesson01/L121.wav',
//   ),
//   CustomWordCard(
//     word: 'ک',
//     subWord: 'کاف',
//     soundPath: 'sounds/Lesson01/L122.wav',
//   ),
//   CustomWordCard(
//     word: 'ل',
//     subWord: 'لام',
//     soundPath: 'sounds/Lesson01/L123.wav',
//   ),
//   CustomWordCard(
//     word: 'م',
//     subWord: 'میم',
//     soundPath: 'sounds/Lesson01/L124.wav',
//   ),
//   CustomWordCard(
//     word: 'ن',
//     subWord: 'نون',
//     soundPath: 'sounds/Lesson01/L125.wav',
//   ),
//   CustomWordCard(
//     word: 'و',
//     subWord: 'واو',
//     soundPath: 'sounds/Lesson01/L126.wav',
//   ),
//   CustomWordCard(
//     word: 'ہ',
//     subWord: 'ہا',
//     soundPath: 'sounds/Lesson01/L127.wav',
//   ),
//   CustomWordCard(
//     word: 'ء',
//     subWord: 'ہمزہ',
//     soundPath: 'sounds/Lesson01/L128.wav',
//   ),
//   CustomWordCard(
//     word: 'ی',
//     subWord: 'یا',
//     soundPath: 'sounds/Lesson01/L129.wav',
//   ),
// ];


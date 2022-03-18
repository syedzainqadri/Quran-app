import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const DB_lesson = "lesson";
const DB_Current_Page_Lesson = "currentLesson";

final Color kGreenLightColor = Color(0xff004E40);
final Color kGreenDarkColor = Color(0xff17382d);
final Color kGoldenColor = Color(0xffF1B54C);
final Color kLightColor = Color(0xffFCF7F3);
final Color kDarkColor = Colors.black;
const kGreenColor = Color(0xFF6AC259);
const kRedColor = Color(0xFFE92E30);

const kgreenText = TextStyle(color: Colors.green);
const kgreenBoldText = TextStyle(
  color: Colors.green,
  fontWeight: FontWeight.bold,
  fontSize: 40.0,
);
const kgreenArabicText =
    TextStyle(color: Colors.green, fontFamily: 'Microsoft Uighur');
const kgreenArabicBoldText = TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.w900,
    fontSize: 40.0,
    fontFamily: 'Microsoft Uighur');

const kBlueCOlor = Colors.blue;

const kblueText = TextStyle(color: Colors.blue);
const kblueBoldText =
    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold);
const kblueArabicText =
    TextStyle(color: Colors.blue, fontFamily: 'Microsoft Uighur');
const kblueArabicBoldText = TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
    fontFamily: 'Microsoft Uighur');

const kblackText = TextStyle(color: Colors.black);
const kblackBoldText =
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
const kblackArabicText =
    TextStyle(color: Colors.black, fontFamily: 'Microsoft Uighur');
const kblackArabicBoldText = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'Microsoft Uighur');

const kredText = TextStyle(color: Colors.red);
const kredBoldText = TextStyle(color: Colors.red, fontWeight: FontWeight.bold);
const kredArabicText =
    TextStyle(color: Colors.red, fontFamily: 'Microsoft Uighur');
const kredArabicBoldText = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontFamily: 'Microsoft Uighur');

const kTabTitle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

final gradientColors = [
  Color(0xff0F2616),
  Color(0xff00472F),
  Color(0xff004D39),
  Color(0xff004E3C),
];
const double kDefaultPadding = 10.0;

getToast(msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: kGreenColor,
      textColor: Colors.white,
      fontSize: 16.0);
}

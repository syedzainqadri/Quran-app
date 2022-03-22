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

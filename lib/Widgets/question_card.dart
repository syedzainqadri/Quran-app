import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/Model/Questions.dart';
import 'package:quranapp/Utilities/constants.dart';
import 'package:quranapp/controllers/question_controller.dart';

import 'quiz_option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key key,
    @required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 30.0),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: kDarkColor),
          ),
          // SizedBox(height: kDefaultPadding / 2),
          Column(
            children: [
              ...List.generate(
                question.options.length,
                (index) => Option(
                  index: index,
                  text: question.options[index],
                  press: () => _controller.checkAns(question, index),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

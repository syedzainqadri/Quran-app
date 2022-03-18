import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/Screens/QuizScreens/quiz_body.dart';
import 'package:quranapp/Utilities/constants.dart';
import 'package:quranapp/controllers/question_controller.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: kGreenDarkColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Flutter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          MaterialButton(
            onPressed: _controller.nextQuestion,
            child: Text(
              "Skip",
              style: TextStyle(color: kLightColor),
            ),
          ),
        ],
      ),
      body: QuizScreens(),
    );
  }
}

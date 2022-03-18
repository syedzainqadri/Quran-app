import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/Utilities/constants.dart';
import 'package:quranapp/Widgets/question_card.dart';
import 'package:quranapp/controllers/question_controller.dart';

class QuizScreens extends StatefulWidget {
  const QuizScreens({
    Key key,
  }) : super(key: key);

  @override
  _QuizScreensState createState() => _QuizScreensState();
}

class _QuizScreensState extends State<QuizScreens> {
  bool result = false;
  void changeState() {
    setState(() {
      result = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController _questionController = Get.put(QuestionController());
    return WillPopScope(
      onWillPop: () async => false,
      child: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: kDefaultPadding),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Obx(
                    () => Text.rich(
                      TextSpan(
                        text:
                            "Question ${_questionController.questionNumber.value}",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: kGoldenColor),
                        children: [
                          TextSpan(
                            text: "/${_questionController.questions.length}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(color: kGoldenColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(thickness: 1.5),
                SizedBox(height: kDefaultPadding),
                Expanded(
                  child: PageView.builder(
                    // Block swipe to next qn
                    // physics: NeverScrollableScrollPhysics(),
                    controller: _questionController.pageController,
                    onPageChanged: _questionController.updateTheQnNum,
                    itemCount: _questionController.questions.length,
                    itemBuilder: (context, index) => QuestionCard(
                        question: _questionController.questions[index]),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

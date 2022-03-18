import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/Screens/QuizScreens/quiz_screen.dart';
import 'package:quranapp/Utilities/constants.dart';
import 'package:quranapp/controllers/question_controller.dart';

class ScoreScreen extends StatefulWidget {
  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  QuestionController _qnController = Get.put(QuestionController());

  String messege;
  String image;
  @override
  void initState() {
    super.initState();
    print(numOfCorrectAns);
  }

  String resultaward(int correctAns, int result) {
    if (result == 2) {
      return "🏆";
    } else if (result == 3) {
      return "🏆🏆";
    } else if (result == 4) {
      return " 🏆🏆🏆";
    } else {
      return "🎖️";
    }
  }

  String resultStatus(int correctAns, int result) {
    if (result == 2) {
      return "You Should Try Hard..\n" + "   You Scored = $result";
    } else if (result == 3) {
      return " You Can Do Better..\n" + "   You Scored = $result";
    } else if (result == 4) {
      return " You Did Very Well..\n" + "   You Scored = $result";
    } else {
      return "You Should Try Hard..\n" + "   You Scored = $result";
    }
  }

  // int numOfCorrectAns;
  // _ScoreScreenState(this.numOfCorrectAns);

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: kGreenDarkColor,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                Spacer(flex: 3),
                Text(
                  "Score",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: kGoldenColor),
                ),
                Spacer(),
                Container(
                  child: Text(
                    resultaward(numOfCorrectAns, _qnController.numOfCorrectAns),
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(color: kGreenColor),
                  ),
                ),
                Spacer(),
                Container(
                  child: Text(
                    resultStatus(
                        numOfCorrectAns, _qnController.numOfCorrectAns),
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: kGreenColor),
                  ),
                ),
                Spacer(),
                Text(
                  "${_qnController.numOfCorrectAns}/${_qnController.questions.length}",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: kLightColor),
                ),
                Spacer(flex: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () {
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (BuildContext context) =>
                          //             QuizScreen()),
                          //     (route) => false);
                          Get.to(QuizScreen());
                          Get.reset();
                        },
                        color: kLightColor,
                        child: Text('Try Again'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: kLightColor,
                        child: Text('Done'),
                        onPressed: () {
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (BuildContext context) =>
                          //             TestScreen()),
                          //     (route) => false);
                        },
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

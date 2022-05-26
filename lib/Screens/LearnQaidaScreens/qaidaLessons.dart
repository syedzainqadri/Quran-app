import 'package:flutter/material.dart';
import 'package:quranapp/Screens/QuizScreens/quiz_screen.dart';
import 'package:quranapp/Utilities/SliverWidgets.dart';
import 'package:quranapp/Utilities/constants.dart';
import 'package:quranapp/Utilities/listQaidaLesson.dart';

class QaidaLessons extends StatefulWidget {
  @override
  _QaidaLessonsState createState() => _QaidaLessonsState();
}

class _QaidaLessonsState extends State<QaidaLessons> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: kGreenLightColor,
              title: MyAppBar(
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QuizScreen(),
                        ));
                  },
                  child: Icon(
                    Icons.ac_unit,
                    size: 25,
                  ),
                ),
                () {},
              ),
              pinned: true,
              expandedHeight: 230,
              flexibleSpace: FlexibleSpaceBar(
                background: MyFlexibleAppBar(
                  Image.asset('assets/images/madaniqaida.png', width: 180),
                  Image.asset('assets/images/ayat01.png', width: 300),
                ),
              ),
            ),
            SliverList(
              /// i have change this code "niaz"
              delegate: SliverChildListDelegate(
                // List.generate(
                //     27,
                //     (index) => CustomLessonListTile(
                //           lessonNo: index < 9
                //               ? (0 + index + 1).toString()
                //               : (index + 1).toString(),
                //           lessonNoU: index < 9
                //               ? (0 + index + 1).toString()
                //               : (index + 1).toString(),
                //           screenName: Lesson01Screen(
                //               lessonModel: lessonDetails.first),
                //         ))

                /// below line is commit
                qaidaLessons,
              ),
            )
          ],
        ),
      ),
    );
  }
}

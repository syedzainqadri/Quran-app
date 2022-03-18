import 'package:flutter/material.dart';
import 'package:quranapp/Utilities/constants.dart';

class CustomLessonListTile extends StatelessWidget {
  const CustomLessonListTile(
      {@required this.lessonNo, this.screenName, this.lessonNoU});

  final String lessonNo;
  final String lessonNoU;
  final Widget screenName;

  @override
  Widget build(BuildContext context) {
    final double dWidth = MediaQuery.of(context).size.width;
    final double dHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => screenName,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: kLightColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1,
                  color: Colors.grey.withOpacity(0.8),
                  offset: Offset(0.5, 0.5),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.asset(
                            'assets/images/circle.png',
                            color: kGoldenColor,
                            height: 40,
                          ),
                          Text(
                            lessonNo,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Lesson No $lessonNo",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'سبق نمبر $lessonNoU',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

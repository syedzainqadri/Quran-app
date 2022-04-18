import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quranapp/Utilities/constants.dart';

class CustomWordCard extends StatelessWidget {
  CustomWordCard({
    @required this.word,
    this.subWord,
    this.soundPath,
    this.isPlaySound,
  });

  final String word;
  final String subWord;
  final bool isPlaySound;
  final String soundPath;
  AudioPlayer audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    final box = Hive.box(DB_lesson);
    final double dWidth = MediaQuery.of(context).size.width;
    final double dHeight = MediaQuery.of(context).size.height;
    void playSound(String soundPath) async {
      await audioPlayer.play(soundPath, isLocal: true);
    }

    return GestureDetector(
      onTap: () {
        // String isLessonNo = box.containsKey(DB_Current_Page_Lesson)
        //     ? box.get(DB_Current_Page_Lesson)
        //     : "null";
        if (soundPath != '' && isPlaySound)
          playSound(
            soundPath,
          );
        else
          getToast("Read The Instruction First!");
      },
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          height: 100,
          width: 100,
          // width: dWidth / 2.4,
          // height: dWidth / 2.3,
          decoration: BoxDecoration(
            color: kBlueCOlor[50],
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                color: kBlueCOlor,
                // offset: Offset(2, 2),
                blurRadius: 0,
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  // top: 20,
                  child: Container(
                      width: 90,
                      height: 50,
                      child: SvgPicture.asset(
                        word,
                        placeholderBuilder: (context) => Center(
                          child: Icon(Icons.image),
                        ),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

// class WordCard extends StatelessWidget {
//   WordCard({
//     @required this.textList,
//   });

//   // final Widget textWidget;
//   final textList;
//   //AudioPlayer audioPlayer = AudioPlayer();
//   final box = Hive.box(DB_lesson);
//   void playSound(String soundPath) async {
//     final player = AudioCache();
//     await player.play(soundPath);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         String isLessonNo = box.containsKey(DB_Current_Page_Lesson)
//             ? box.get(DB_Current_Page_Lesson)
//             : "null";
//         bool isDoneInst = box.containsKey(isLessonNo);
//         if (isDoneInst)
//           getToast("No Audio Found!");
//         // playSound(soundPath);
//         else
//           getToast("Read The Instruction First!");
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(3.0),
//         child: Container(
//           height: 80,
//           width: 80,
//           // width: dWidth / 2.4,
//           // height: dWidth / 2.3,
//           decoration: BoxDecoration(
//             color: kLightColor,
//             borderRadius: BorderRadius.circular(15),
//             boxShadow: [
//               BoxShadow(
//                 spreadRadius: 1,
//                 color: kGoldenColor.withOpacity(0.8),
//                 offset: Offset(2, 2),
//                 blurRadius: 0,
//               ),
//             ],
//           ),
//           child: Center(
//             child: RichText(
//               text: TextSpan(
//                 style: TextStyle(
//                   fontSize: 40,
//                   color: Colors.black,
//                   fontFamily: 'Microsoft Uighur',
//                 ),
//                 children: textList,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Message"),
    content: Text("Please Read Instruction Before Listen"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

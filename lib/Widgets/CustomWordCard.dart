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
    // this.subWord,
    this.soundPath,
    this.isPlaySound,
  });

  final String word;
  // final String subWord;
  final bool isPlaySound;
  final String soundPath;
  // final audioPlayer = AudioCache();
  @override
  Widget build(BuildContext context) {
    void playSound(String soundPath) async {
      final audioPlayer = AudioCache();
      // audioPlayer.fixedPlayer.stop();
      await audioPlayer.play(soundPath,
          mode: PlayerMode.LOW_LATENCY, stayAwake: false);
    }

    return GestureDetector(
      onTap: () {
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
          decoration: BoxDecoration(
            color: kBlueCOlor[50],
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                color: kBlueCOlor,
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

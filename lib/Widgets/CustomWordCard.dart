import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quranapp/Utilities/constants.dart';

// ignore: must_be_immutable
class CustomWordCard extends StatelessWidget {
  CustomWordCard(
      {@required this.word,
      // this.subWord,
      this.soundPath,
      this.isPlaySound,
      this.svg});

  final String word;
  String svg;
  // final String subWord;
  final bool isPlaySound;
  final String soundPath;
  // final audioPlayer = AudioCache();
  @override
  Widget build(BuildContext context) {
    var audio = AudioPlayer();

    // void playSound(String soundPath) async {

    //   final audioPlayer = AudioCache();
    //   // audioPlayer.fixedPlayer.stop();
    //   await audioPlayer.play(soundPath,
    //       mode: PlayerMode.LOW_LATENCY, stayAwake: false);
    // }

    return GestureDetector(
      onTap: () {
        if (soundPath != '' && isPlaySound)
          audio.play(soundPath);
        // playSound(
        //   soundPath,
        // );
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
                      child: svg == null
                          ? Center(
                              child: Text(
                              word.toString(),
                              style: TextStyle(
                                  fontSize:
                                      word.toString().length > 3 ? 28 : 34,
                                  fontWeight: FontWeight.bold),
                            ))
                          : SvgPicture.network(
                              svg,
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
  Widget okButton = ElevatedButton(
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

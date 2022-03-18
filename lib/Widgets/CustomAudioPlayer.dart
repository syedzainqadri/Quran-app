// import 'package:audioplayers/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:quranapp/Utilities/constants.dart';

// class CustomAudioPlayer extends StatefulWidget {
//   // CustomAudioPlayer({
//   //   @required this.audioPath,
//   // });
//   // final String audioPath;
//   @override
//   _CustomAudioPlayerState createState() => _CustomAudioPlayerState();
// }

// class _CustomAudioPlayerState extends State<CustomAudioPlayer> {
//   AudioCache audioCache;
//   AudioPlayer _audioPlayer = AudioPlayer();
//   bool isPlaying = false;
//   String currentTime = "00:00";
//   String completeTime = "00:00";
//   Duration _duration = new Duration();
//   Duration _position = new Duration();
//   Duration _slider = new Duration(seconds: 0);

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _audioPlayer.durationHandler = (d) => setState(() {
//           _duration = d;
//         });

//     _audioPlayer.positionHandler = (p) => setState(() {
//           _position = p;
//         });

//     _audioPlayer.onAudioPositionChanged.listen((Duration duration) {
//       setState(() {
//         currentTime = duration.toString().split(".")[0];
//       });
//     });

//     _audioPlayer.onDurationChanged.listen((Duration duration) {
//       setState(() {
//         completeTime = duration.toString().split(".")[0];
//       });
//     });

//     audioCache = new AudioCache(fixedPlayer: _audioPlayer);
//   }

//   void seekToSecond(int second) {
//     Duration newDuration = Duration(seconds: second);

//     _audioPlayer.seek(newDuration);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             alignment: Alignment.center,
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * 0.08,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(50),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 5,
//                   ),
//                   child: GestureDetector(
//                     child:
//                         isPlaying ? Icon(Icons.play_arrow) : Icon(Icons.pause),
//                     onTap: () {
//                       setState(() {
//                         if (!isPlaying) {
//                           _audioPlayer.pause();

//                           isPlaying = true;
//                         } else {
//                           audioCache.play('audio/z.mp3');

//                           isPlaying = false;
//                         }
//                       });
//                     },
//                   ),
//                 ),
//                 Text(
//                   currentTime,
//                   style: TextStyle(fontWeight: FontWeight.w700),
//                 ),
//                 SliderTheme(
//                   data: SliderTheme.of(context).copyWith(
//                     inactiveTrackColor: kLightColor,
//                     activeTrackColor: kGreenLightColor,
//                     thumbColor: kGoldenColor,
//                     overlayColor: kGreenLightColor.withOpacity(0.4),
//                     thumbShape: RoundSliderThumbShape(
//                       enabledThumbRadius: 10.0,
//                     ),
//                     overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
//                   ),
//                   child: Slider(
//                     value: _position.inSeconds.toDouble(),
//                     max: _duration.inSeconds.toDouble(),
//                     onChanged: (double value) {
//                       setState(() {
//                         seekToSecond(value.toInt());
//                         value = value;
//                       });
//                     },
//                   ),
//                 ),
//                 Text(
//                   completeTime,
//                   style: TextStyle(fontWeight: FontWeight.w300),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

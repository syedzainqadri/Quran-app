import 'dart:async';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quranapp/Screens/homeScreen.dart';
import 'package:quranapp/Screens/landingPage.dart';
import 'package:quranapp/Utilities/constants.dart';
import 'package:quranapp/Utilities/delayedAnimation.dart';
import 'onboarding_Screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // startTime() async {
  //   var _duration = Duration(seconds: 6);
  //   return Timer(_duration, navigationPage);
  // }

  // void navigationPage() {
  //   Navigator.of(context).pushAndRemoveUntil(
  //       MaterialPageRoute(builder: (context) => Onbording()),
  //       (Route<dynamic> route) => false);
  // }

  final int delayedAmount = 500;
  double _scale;
  AnimationController _controller;
  final box = Hive.box(DB_lesson);
  @override
  void initState() {
    // startTime();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: kGreenLightColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AvatarGlow(
                  endRadius: 90,
                  duration: Duration(seconds: 2),
                  glowColor: Colors.white24,
                  repeat: true,
                  repeatPauseDuration: Duration(seconds: 2),
                  startDelay: Duration(seconds: 1),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 150,
                  ),
                ),
                DelayedAnimation(
                  child: Text(
                    "Shafiq",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: color),
                  ),
                  delay: delayedAmount + 1000,
                ),
                DelayedAnimation(
                  child: Text(
                    "Quran Learning",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: color),
                  ),
                  delay: delayedAmount + 1300,
                ),
                SizedBox(
                  height: 30.0,
                ),
                DelayedAnimation(
                  child: Text(
                    "Learn Basic Quran Reading",
                    style: TextStyle(fontSize: 20.0, color: color),
                  ),
                  delay: delayedAmount + 1400,
                ),
                DelayedAnimation(
                  child: Text(
                    "with More advanced features",
                    style: TextStyle(fontSize: 20.0, color: color),
                  ),
                  delay: delayedAmount + 1500,
                ),
                SizedBox(
                  height: 100.0,
                ),
                DelayedAnimation(
                  child: GestureDetector(
                    onTapDown: _onTapDown,
                    onTapUp: _onTapUp,
                    child: Transform.scale(
                      scale: _scale,
                      child: _animatedButtonUI,
                    ),
                  ),
                  delay: delayedAmount + 1600,
                ),
                SizedBox(
                  height: 50.0,
                ),
                // DelayeSplashScreenation(
                //   child: Text(
                //     "I Already have An Account".toUpperCase(),
                //     style: TextStyle(
                //         fontSize: 20.0,
                //         fontWeight: FontWeight.bold,
                //         color: color),
                //   ),
                //   delay: delayedAmount + 5000,
                // ),
              ],
            ),
          )),
    );
  }

  Widget get _animatedButtonUI => GestureDetector(
        onTap: () => box.containsKey("intro")
            ? Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => LandingPage(),
                ),
                (route) => false)
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Onbording(),
                ),
              ),
        child: Container(
          height: 60,
          width: 270,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              'GoTo Learn',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: kGoldenColor,
              ),
            ),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}

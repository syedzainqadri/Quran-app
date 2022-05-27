import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/Model/firebasefile.dart';
import 'package:quranapp/Model/lesson.dart';
import 'package:quranapp/Utilities/LessonsContentList/listLesson16.dart';
import 'package:quranapp/Utilities/SliverWidgets.dart';
import 'package:quranapp/Utilities/constants.dart';
import 'package:quranapp/Widgets/CustomWordCard.dart';
import 'package:quranapp/controllers/lesson01_controller.dart';
import 'package:showcaseview/showcaseview.dart';
import "dart:core";

class Lesson16Screen extends StatefulWidget {
  final LessonModel lessonModel;

  const Lesson16Screen({Key key, this.lessonModel}) : super(key: key);

  @override
  State<Lesson16Screen> createState() => _Lesson16ScreenState();
}

class _Lesson16ScreenState extends State<Lesson16Screen> {
  GlobalKey _one = GlobalKey();
  Future<List<FirebaseFile>> instructions;
  @override
  void initState() {
    Get.put(Lesson01Controller());
    print(instructions);
    super.initState();
  }

  bool isPlaySound = false;
  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      blurValue: 1,
      autoPlay: false,
      autoPlayDelay: Duration(seconds: 3),
      autoPlayLockEnable: false,
      onStart: (ind, key) {
        print("index=> $ind key=> $key");
      },
      onComplete: (index, key) {
        print("index=> $index key=> $key");
      },
      builder: Builder(builder: (context) {
        return SafeArea(
          child: Scaffold(
              floatingActionButton: Showcase(
                description: "Instruction",
                key: _one,
                child: Obx(() {
                  final controller = Get.find<Lesson01Controller>();
                  return FloatingActionButton(
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        barrierDismissible: controller.canDissmisse.value,
                        barrierColor: kGreenColor.withOpacity(0.3),
                        builder: (builder) {
                          return WillPopScope(
                            onWillPop: () async =>
                                controller.canDissmisse.value,
                            child: AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              insetPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                              titlePadding:
                                  EdgeInsets.symmetric(horizontal: 15),
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(Icons.api_outlined),
                                    Text(
                                      'بچوں کو چھوتی شکلوں کی پہچان کر وائیں',
                                      textAlign: TextAlign.end,
                                    ),
                                    Icon(Icons.api_outlined),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "✦✦\n------\n✦✦",
                                          style: TextStyle(fontSize: 10),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "✦\n------\n✦",
                                          style: TextStyle(fontSize: 10),
                                          textAlign: TextAlign.center,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "✦",
                                              style: TextStyle(fontSize: 10),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              "✦✦",
                                              style: TextStyle(fontSize: 10),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "✦✦",
                                          style: TextStyle(fontSize: 10),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "✦",
                                          style: TextStyle(fontSize: 10),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          " .قطوں کی پہچان کیجیے",
                                          textAlign: TextAlign.end,
                                        ),
                                      ],
                                    ),
                                    Icon(Icons.api_outlined),
                                  ],
                                ),
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    controller.canDissmisse.value
                                        ? Text("")
                                        : CircularCountDownTimer(
                                            duration:
                                                controller.canDissmisse.value
                                                    ? 5
                                                    : 5,
                                            initialDuration: 0,
                                            controller: CountDownController(),
                                            width: 40,
                                            height: 40,
                                            ringColor: Colors.grey[300],
                                            ringGradient: null,
                                            fillColor: kGreenColor,
                                            fillGradient: null,
                                            backgroundColor: kGreenColor,
                                            backgroundGradient: null,
                                            strokeWidth: 3.0,
                                            strokeCap: StrokeCap.round,
                                            textStyle: TextStyle(
                                                fontSize: 33.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                            textFormat: CountdownTextFormat.S,
                                            isReverse: false,
                                            isReverseAnimation: false,
                                            isTimerTextShown: true,
                                            autoStart: true,
                                            onStart: () {
                                              print('Countdown Started');
                                            },
                                            onComplete: () {
                                              print('Countdown Ended');
                                              Get.find<Lesson01Controller>()
                                                  .updateCanDissmisse(true);
                                              Get.back();
                                            },
                                          ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    backgroundColor: controller.canDissmisse.value
                        ? kGreenColor
                        : kGreenColor,
                    child: Icon(
                      CupertinoIcons.info,
                      color: Colors.yellow,
                      size: 40,
                    ),
                  );
                }),
              ),
              body: FutureBuilder<List<FirebaseFile>>(
                  // future: getfile(),
                  builder: (BuildContext context, AsyncSnapshot fsnapshot) {
                // final files = fsnapshot?.data;
                if (fsnapshot.hasError) {
                  return Container(
                    child: Center(
                      child: Text(fsnapshot.error.toString()),
                    ),
                  );
                }

                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: CustomScrollView(
                    slivers: <Widget>[
                      ///First sliver is the App Bar
                      SliverAppBar(
                        backgroundColor: kGreenLightColor,
                        title: MyAppBar(
                          Icon(
                            Icons.ac_unit,
                            size: 25,
                          ),
                          () {},
                        ),
                        pinned: true,
                        expandedHeight: 230,
                        flexibleSpace: FlexibleSpaceBar(
                          background: MyFlexibleAppBar(
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Image.asset('assets/images/bismillah.png',
                                  width: 80),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/texture/lessonTexture.png',
                                  width: 310,
                                ),
                                Text(
                                  'شديعنى شديد',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return CustomWordCard(
                              isPlaySound: true,
                              word: _mylist[index].text.toString(),
                              //  svg: "",
                              soundPath: _mylist[index].sound.toString(),
                            );
                          },
                          childCount: _mylist.length,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          // mainAxisExtent: 70,
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 5,
                          childAspectRatio: 1,
                        ),
                      ),
                    ],
                  ),
                );
              })),
        );
      }),
    );
  }

  List _mylist = listLesson16;
}



//----------------------------------------------------------------------------------


 

 
 
 
 
 
 

  
  
  
 
 
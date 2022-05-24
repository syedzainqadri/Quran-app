import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranapp/Model/firebasefile.dart';
import 'package:quranapp/Model/lesson.dart';
import 'package:quranapp/Utilities/LessonsContentList/listLesson04.dart';
import 'package:quranapp/Utilities/SliverWidgets.dart';
import 'package:quranapp/Utilities/constants.dart';
import 'package:quranapp/Widgets/CustomWordCard.dart';
import 'package:showcaseview/showcaseview.dart';
import "dart:core";
import '../../Model/sub_list.dart';
import '../../controllers/lesson03_controller.dart';

class Lesson04Screen extends StatefulWidget {
  final LessonModel lessonModel;

  const Lesson04Screen({Key key, this.lessonModel}) : super(key: key);

  @override
  State<Lesson04Screen> createState() => _Lesson04ScreenState();
}

class _Lesson04ScreenState extends State<Lesson04Screen> {
  GlobalKey _one = GlobalKey();
  // Future<List<FirebaseFile>> files;
  // Future<List<FirebaseFile>> sounds;
  Future<List<FirebaseFile>> instructions;
  // GlobalKey _one = GlobalKey();
  //final box = Hive.box(DB_lesson);

  @override
  void initState() {
    // box.put(DB_Current_Page_Lesson, widget.lessonModel.lessonNo);
    Get.put(Lesson03Controller());

    // instructions = FirebaseApi.listAll('instruction1/');
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
                  final controller = Get.find<Lesson03Controller>();
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
                                      'دو یا اس سے زائدالفاز مل کر ایک مرکب بنتا ہے',
                                      textAlign: TextAlign.end,
                                    ),
                                    Icon(Icons.api_outlined),
                                    Text(
                                      'حروف مرکبات الگ الگ کر کے یاد کر واہیں',
                                      textAlign: TextAlign.end,
                                    ),
                                    Icon(Icons.api_outlined),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
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
                                            Text(
                                              "------",
                                              style: TextStyle(fontSize: 10),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
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
                                              Get.find<Lesson03Controller>()
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
                  builder: (BuildContext context, AsyncSnapshot fsnapshot) {
                //  final files = fsnapshot?.data;
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
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Image.asset(
                                    "assets/letters/l4.png",
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                  ),
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
                              // svg: _mylist[index].text.toString(),
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
                          childAspectRatio: 1.0,
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

  List<SubListModel> _mylist = listLesson04;
}

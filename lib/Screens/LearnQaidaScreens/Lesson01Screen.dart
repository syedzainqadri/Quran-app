import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quranapp/Model/firebasefile.dart';
import 'package:quranapp/Model/lesson.dart';
import 'package:quranapp/Utilities/SliverWidgets.dart';
import 'package:quranapp/Utilities/constants.dart';
import 'package:quranapp/Widgets/CustomWordCard.dart';
import 'package:quranapp/Widgets/instruction_widget.dart';
import 'package:quranapp/controllers/lesson01_controller.dart';
import 'package:quranapp/firebaseApi/firebaseApi.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import "dart:core";

class Lesson01Screen extends StatefulWidget {
  final LessonModel lessonModel;

  const Lesson01Screen({Key key, this.lessonModel}) : super(key: key);

  @override
  State<Lesson01Screen> createState() => _Lesson01ScreenState();
}

class _Lesson01ScreenState extends State<Lesson01Screen> {
  Future<List<FirebaseFile>> files;
  Future<List<FirebaseFile>> sounds;
  Future<List<FirebaseFile>> instructions;
  GlobalKey _one = GlobalKey();
  //final box = Hive.box(DB_lesson);

  @override
  void initState() {
    // box.put(DB_Current_Page_Lesson, widget.lessonModel.lessonNo);
    Get.put(Lesson01Controller());

    instructions = FirebaseApi.listAll('instruction1/');

    super.initState();
  }

  getfile() {
    sounds = FirebaseApi.listAll('sound1/');
    files = FirebaseApi.listAll('text1/');
    return files;
  }

  @override
  void dispose() {
    Get.find<Lesson01Controller>().dispose();
    super.dispose();
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
              floatingActionButton: FloatingActionButton(
                backgroundColor: kGreenColor,
                child: Icon(
                  CupertinoIcons.info,
                  color: Colors.yellow,
                  size: 40,
                ),
                onPressed: () {
                  setState(() {
                    isPlaySound = true;
                  });
                  showInstructionDialog(
                      context: context,
                      instructions: instructions,
                      itemLength: 6,
                      url:
                          "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/instruction1%2Fi");
                },
              ),
              body: FutureBuilder<List<FirebaseFile>>(
                  future: getfile(),
                  builder: (BuildContext context, AsyncSnapshot fsnapshot) {
                    final files = fsnapshot?.data;
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
                                  child: Image.asset(
                                      'assets/images/bismillah.png',
                                      width: 80),
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/texture/lessonTexture.png',
                                      width: 310,
                                    ),
                                    SvgPicture.network(
                                      "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/text1%2F0.svg?alt=media&token=c9029d17-018d-4cbb-9696-976520720b94",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return CustomWordCard(
                                    isPlaySound: isPlaySound,
                                    word:
                                        "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/text1%2F${index + 1}.svg?alt=media&token=c9029d17-018d-4cbb-9696-976520720b94",
                                    soundPath:
                                        "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/sound1%2FL1${index + 1}.wav?alt=media&token=a7dc3455-7626-41c9-8cae-fbb7be8592d6");
                              },
                              childCount: 29,
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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

                    return Center(
                      child: Container(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  })),
        );
      }),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:quranapp/Model/firebasefile.dart';
import 'package:quranapp/Model/lesson.dart';
import 'package:quranapp/Utilities/SliverWidgets.dart';
import 'package:quranapp/Utilities/constants.dart';
import 'package:quranapp/Widgets/CustomWordCard.dart';
import 'package:quranapp/Widgets/instruction_widget.dart';
import 'package:quranapp/controllers/lesson02_controller%20.dart';
import 'package:quranapp/firebaseApi/firebaseApi.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import "dart:core";

class Lesson02Screen extends StatefulWidget {
  final LessonModel lessonModel;

  const Lesson02Screen({Key key, this.lessonModel}) : super(key: key);

  @override
  State<Lesson02Screen> createState() => _Lesson02ScreenState();
}

class _Lesson02ScreenState extends State<Lesson02Screen> {
  Future<List<FirebaseFile>> files;
  Future<List<FirebaseFile>> sounds;
  Future<List<FirebaseFile>> instructions;
  GlobalKey _one = GlobalKey();
  final box = Hive.box(DB_lesson);

  @override
  void initState() {
    // box.put(DB_Current_Page_Lesson, widget.lessonModel.lessonNo);
    Get.put(Lesson02Controller());

    instructions = FirebaseApi.listAll('instruction2/');

    super.initState();
  }

  getfile() {
    sounds = FirebaseApi.listAll('sound2/');
    files = FirebaseApi.listAll('text2/');
    return files;
  }

  @override
  void dispose() {
    Get.find<Lesson02Controller>().dispose();
    super.dispose();
  }

  bool isPlaySound = false;
  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      blurValue: 1,
      autoPlay: false,
      // autoPlayDelay: Duration(seconds: 3),
      autoPlayLockEnable: false,
      onStart: (ind, key) {
        print("index=> $ind key=> $key");
      },
      onComplete: (index, key) {
        print("index=> $index key=> $key");
      },
      builder: Builder(builder: (context) {
        // if (!box.containsKey(widget.lessonModel.lessonNo))
        //   WidgetsBinding.instance.addPostFrameCallback(
        //       (_) => ShowCaseWidget.of(context).startShowCase([_one]));
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
                      itemLength: 1,
                      url:
                          "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/instruction2%2Fi");
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
                                      "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/text2%2F0.svg?alt=media&token=c9029d17-018d-4cbb-9696-976520720b94",
                                    ),
                                    // Text(

                                    //   // '${widget.lessonModel.title_eng} - ${widget.lessonModel.title_ar}',
                                    //   style: TextStyle(
                                    //     fontSize: 16,
                                    //     fontWeight: FontWeight.bold,
                                    //     color: kGoldenColor,
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ),

                          SliverGrid(
                            //  spacing: 7,
                            // runSpacing: 10,
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                // print(sounds[1].url);
                                return CustomWordCard(
                                    isPlaySound: isPlaySound,
                                    word:
                                        "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/text2%2F${index + 1}.svg?alt=media&token=c9029d17-018d-4cbb-9696-976520720b94",
                                    // subWord: sounds[index].url,
                                    soundPath:
                                        "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/sound2%2FL2%20${index + 1}.wav?alt=media&token=f7e01e1b-385c-4cac-8ad7-17c477a6d5c5");
                              },
                              childCount: 47,
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 5,
                              childAspectRatio: 1.0,
                            ),
                          ),
                        ],
                      ),
                    );

                    // return Center(
                    //   child: Container(
                    //     child: CircularProgressIndicator(),
                    //   ),
                    // );
                  })),
        );
      }),
    );
  }
}

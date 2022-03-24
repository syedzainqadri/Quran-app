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
import 'package:quranapp/controllers/lesson03_controller.dart';
import 'package:quranapp/firebaseApi/firebaseApi.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import "dart:core";

import '../../Widgets/instruction_widget.dart';

class Lesson03Screen extends StatefulWidget {
  final LessonModel lessonModel;

  const Lesson03Screen({Key key, this.lessonModel}) : super(key: key);

  @override
  State<Lesson03Screen> createState() => _Lesson03ScreenState();
}

class _Lesson03ScreenState extends State<Lesson03Screen> {
  Future<List<FirebaseFile>> files;
  Future<List<FirebaseFile>> sounds;
  Future<List<FirebaseFile>> instructions;
  GlobalKey _one = GlobalKey();
  //final box = Hive.box(DB_lesson);

  @override
  void initState() {
    // box.put(DB_Current_Page_Lesson, widget.lessonModel.lessonNo);
    Get.put(Lesson03Controller());
    sounds = FirebaseApi.listAll('sound3/');
    files = FirebaseApi.listAll('text3/');
    instructions = FirebaseApi.listAll('instruction3/');

    super.initState();
  }

  @override
  void dispose() {
    Get.find<Lesson03Controller>().dispose();
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
                      itemLength: 0,
                      url:
                          "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/instruction3%2Fi");
                },
              ),
              body: FutureBuilder(
                  future: Future.wait([files, sounds]),
                  builder: (BuildContext context, AsyncSnapshot fsnapshot) {
                    // final files = fsnapshot?.data[0];
                    // final sounds = fsnapshot?.data[1];
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
                                      "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/text3%2F1.svg?alt=media&token=b341539c-1d39-43c3-a719-b013e309a5cd",
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
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                              // print(fsnapshot.data[1][4].url);
                              return CustomWordCard(
                                  // word: fsnapshot.data[0][index].url,
                                  isPlaySound: isPlaySound,
                                  word:
                                      "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/text3%2F${index + 1}.svg?alt=media&token=b341539c-1d39-43c3-a719-b013e309a5cd",
                                  // subWord: sounds[index].url,
                                  soundPath:
                                      // fsnapshot.data[1][index].url,
                                      "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/sound3%2FL3%20${index + 1}.wav?alt=media&token=46a9c366-f2ca-4531-815d-18304dd4d48b");
                              // " https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/sound3%2FL3%201.wav?alt=media&token=46a9c366-f2ca-4531-815d-18304dd4d48b;
                            },
                                    // childCount: fsnapshot.data[0].length - 1,
                                    childCount: 120),
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

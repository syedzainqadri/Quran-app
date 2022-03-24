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
import 'package:quranapp/controllers/lesson17_controller.dart';
import 'package:quranapp/firebaseApi/firebaseApi.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import "dart:core";

class Lesson17Screen extends StatefulWidget {
  final LessonModel lessonModel;

  const Lesson17Screen({Key key, this.lessonModel}) : super(key: key);

  @override
  State<Lesson17Screen> createState() => _Lesson17ScreenState();
}

class _Lesson17ScreenState extends State<Lesson17Screen> {
  Future<List<FirebaseFile>> files;
  Future<List<FirebaseFile>> sounds;
  Future<List<FirebaseFile>> instructions;
  GlobalKey _one = GlobalKey();
  //final box = Hive.box(DB_lesson);

  @override
  void initState() {
    // box.put(DB_Current_Page_Lesson, widget.lessonModel.lessonNo);
    Get.put(Lesson17Controller());
    sounds = FirebaseApi.listAll('sound17/');
    files = FirebaseApi.listAll('text17/');
    instructions = FirebaseApi.listAll('instruction17/');

    super.initState();
  }

  @override
  void dispose() {
    Get.find<Lesson17Controller>().dispose();
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
                      itemLength: 4,
                      url:
                          "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/instruction17%2Fi");
                },
              ),
              body: FutureBuilder(
                  future: Future.wait([files, sounds]),
                  builder: (BuildContext context, AsyncSnapshot fsnapshot) {
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
                            expandedHeight: 300,
                            flexibleSpace: FlexibleSpaceBar(
                              background: MyFlexibleAppBar(
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 19.0),
                                  child: Image.asset(
                                    'assets/images/bismillah.png',
                                    width: 190,
                                    height: 120,
                                  ),
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/texture/lessonTexture.png',
                                      width: 280,
                                    ),
                                    SvgPicture.network(
                                      "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/text17%2F0.svg?alt=media&token=895c9ad1-c1e4-4935-a353-002fa55fdee4",
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
                            // runSpacing: 17,
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                // print(fsnapshot.data[0][0].url);
                                return CustomWordCard(
                                  isPlaySound: isPlaySound,
                                  word:
                                      "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/text17%2F${index + 1}.svg?alt=media&token=895c9ad1-c1e4-4935-a353-002fa55fdee4",
                                  soundPath:
                                      "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/sound17%2F${index + 1}.wav?alt=media&token=2ccb240a-4e4f-4a91-8f6a-df6932899852",
                                );
                              },
                              childCount: 3,
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 11,
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

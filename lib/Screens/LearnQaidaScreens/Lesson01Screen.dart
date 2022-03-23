import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quranapp/Model/firebasefile.dart';
import 'package:quranapp/Model/lesson.dart';
import 'package:quranapp/Utilities/SliverWidgets.dart';
import 'package:quranapp/Utilities/constants.dart';
import 'package:quranapp/Widgets/CustomWordCard.dart';
import 'package:quranapp/controllers/lesson01_controller.dart';
import 'package:quranapp/controllers/lesson_controller/lessons_controller.dart';
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
  List<FirebaseFile> files;
  // Future<List<FirebaseFile>> sounds;
  Future<List<FirebaseFile>> instructions;
  GlobalKey _one = GlobalKey();
  bool isLoading = true;
  var lessonController = Get.put(LessonsController());
  //final box = Hive.box(DB_lesson);

  getfile() async {
    // sounds = FirebaseApi.listAll('sound1/');
    files = await FirebaseApi.listAll('text1/');

    return files;
  }

  @override
  void initState() {
    // box.put(DB_Current_Page_Lesson, widget.lessonModel.lessonNo);
    // Get.put(Lesson01Controller());
    // getfile();
    // // ignore: missing_return
    // instructions = FirebaseApi.listAll('instruction1/');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      lessonController.getLessons("text1/");
    });

    super.initState();
  }

  @override
  void dispose() {
    // Get.find<Lesson01Controller>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return ShowCaseWidget(
    //   blurValue: 1,
    //   autoPlay: false,
    //   autoPlayDelay: Duration(seconds: 3),
    //   autoPlayLockEnable: false,
    //   onStart: (ind, key) {
    //     print("index=> $ind key=> $key");
    //   },
    //   onComplete: (index, key) {
    //     print("index=> $index key=> $key");
    //   },
    //   builder: Builder(builder: (context) {
    return SafeArea(child: Scaffold(
        // floatingActionButton: Showcase(
        //   description: "Instruction",
        //   key: _one,
        //   child: Obx(() {
        //     final controller = Get.find<Lesson01Controller>();
        //     return FloatingActionButton(
        //       onPressed: () async {
        //         await showDialog(
        //           context: context,
        //           barrierDismissible: controller.canDissmisse.value,
        //           barrierColor: kGreenColor.withOpacity(0.3),
        //           builder: (builder) {
        //             return WillPopScope(
        //               onWillPop: () async => controller.canDissmisse.value,
        //               child: AlertDialog(
        //                 shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(30),
        //                 ),
        //                 titlePadding: EdgeInsets.symmetric(horizontal: 15),
        //                 content: FutureBuilder<List<FirebaseFile>>(
        //                     future: FirebaseApi.listAll('instruction1/'),
        //                     builder: (BuildContext context,
        //                         AsyncSnapshot snapshot) {
        //                       if (snapshot.hasError) {
        //                         return Center(
        //                             child: Text('Some error occurred!'));
        //                       }
        //                       if (snapshot.hasData) {
        //                         // final instruction = snapshot?.data;
        //                         return Column(
        //                           children: [
        //                             Expanded(
        //                               flex: 2,
        //                               child: Row(
        //                                 crossAxisAlignment:
        //                                     CrossAxisAlignment.center,
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.center,
        //                                 children: [
        //                                   Icon(Icons.api_outlined),
        //                                   Icon(Icons.api_outlined),
        //                                   Icon(Icons.api_outlined),
        //                                   Icon(Icons.api_outlined),
        //                                 ],
        //                               ),
        //                             ),
        //                             Expanded(
        //                               flex: 6,
        //                               child: ListView.builder(
        //                                   // itemCount: snapshot.data.length,
        //                                   itemCount: 5,
        //                                   itemBuilder:
        //                                       (BuildContext context,
        //                                           int index) {
        //                                     return Container(
        //                                       height: 50,
        //                                       width: 400,
        //                                       child: SvgPicture.network(
        //                                         "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/instruction1%2Fi${index + 1}.svg?alt=media&token=46011e92-dfce-49e7-9972-0e1cdf195d5b",
        //                                         // fit: BoxFit.cover,
        //                                       ),
        //                                     );
        //                                   }),
        //                             ),
        //
        //                             // Icon(Icons.api_outlined),
        //                             Expanded(
        //                               flex: 2,
        //                               child: Row(
        //                                 crossAxisAlignment:
        //                                     CrossAxisAlignment.center,
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.center,
        //                                 children: [
        //                                   Icon(Icons.api_outlined),
        //                                   Icon(Icons.api_outlined),
        //                                   Icon(Icons.api_outlined),
        //                                   Icon(Icons.api_outlined),
        //                                 ],
        //                               ),
        //                             )
        //                           ],
        //                         );
        //                       } else {
        //                         return Center(
        //                           child: CircularProgressIndicator(),
        //                         );
        //                       }
        //                     }),
        //                 actions: [
        //                   Row(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: [
        //                       controller.canDissmisse.value
        //                           ? Text("")
        //                           : CircularCountDownTimer(
        //                               duration:
        //                                   controller.canDissmisse.value
        //                                       ? 5
        //                                       : 5,
        //                               initialDuration: 0,
        //                               controller: CountDownController(),
        //                               width: 40,
        //                               height: 40,
        //                               ringColor: Colors.grey[300],
        //                               ringGradient: null,
        //                               fillColor: kGreenColor,
        //                               fillGradient: null,
        //                               backgroundColor: kGreenColor,
        //                               backgroundGradient: null,
        //                               strokeWidth: 3.0,
        //                               strokeCap: StrokeCap.round,
        //                               textStyle: TextStyle(
        //                                   fontSize: 33.0,
        //                                   color: Colors.white,
        //                                   fontWeight: FontWeight.bold),
        //                               textFormat: CountdownTextFormat.S,
        //                               isReverse: false,
        //                               isReverseAnimation: false,
        //                               isTimerTextShown: true,
        //                               autoStart: true,
        //                               onStart: () {
        //                                 print('Countdown Started');
        //                               },
        //                               onComplete: () {
        //                                 print('Countdown Ended');
        //                                 Get.find<Lesson01Controller>()
        //                                     .updateCanDissmisse(true);
        //                                 Get.back();
        //                               },
        //                             ),
        //                     ],
        //                   ),
        //                 ],
        //               ),
        //             );
        //           },
        //         );
        //       },
        //       backgroundColor:
        //           controller.canDissmisse.value ? kGreenColor : kGreenColor,
        //       child: Icon(
        //         CupertinoIcons.info,
        //         color: Colors.yellow,
        //         size: 40,
        //       ),
        //     );
        //   }),
        // ),
        // body: isLoading
        //     ? Center(
        //         child: CircularProgressIndicator(),
        //       )
        //     : ListView.builder(itemBuilder: (context, index) {
        //         return Directionality(
        //           textDirection: TextDirection.rtl,
        //           child: CustomScrollView(
        //             slivers: <Widget>[
        //               ///First sliver is the App Bar
        //               SliverAppBar(
        //                 backgroundColor: kGreenLightColor,
        //                 title: MyAppBar(
        //                   Icon(
        //                     Icons.ac_unit,
        //                     size: 25,
        //                   ),
        //                   () {},
        //                 ),
        //                 pinned: true,
        //                 expandedHeight: 230,
        //                 flexibleSpace: FlexibleSpaceBar(
        //                   background: MyFlexibleAppBar(
        //                     Padding(
        //                       padding: const EdgeInsets.only(bottom: 8.0),
        //                       child: Image.asset(
        //                           'assets/images/bismillah.png',
        //                           width: 80),
        //                     ),
        //                     Stack(
        //                       alignment: Alignment.center,
        //                       children: [
        //                         Image.asset(
        //                           'assets/texture/lessonTexture.png',
        //                           width: 310,
        //                         ),
        //                         SvgPicture.network(
        //                           "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/text1%2F0.svg?alt=media&token=c9029d17-018d-4cbb-9696-976520720b94",
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //
        //               SliverGrid(
        //                 delegate: SliverChildBuilderDelegate(
        //                   (context, index) {
        //                     return CustomWordCard(
        //                         word:
        //                             "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/text1%2F${index + 1}.svg?alt=media&token=c9029d17-018d-4cbb-9696-976520720b94",
        //                         soundPath:
        //                             "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/sound1%2FL1${index + 1}.wav?alt=media&token=a7dc3455-7626-41c9-8cae-fbb7be8592d6");
        //                   },
        //                   // childCount:,
        //                 ),
        //                 gridDelegate:
        //                     SliverGridDelegateWithFixedCrossAxisCount(
        //                   // mainAxisExtent: 70,
        //                   crossAxisCount: 3,
        //                   mainAxisSpacing: 10,
        //                   crossAxisSpacing: 5,
        //                   childAspectRatio: 1.0,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         );
        //       })
        body: Obx(() {
      if (lessonController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        print(" in else on lesson screen");
        return ListView.builder(itemBuilder: (context, index) {
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
                          word: lessonController.urls.value[index],
                          // "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/text1%2F${index + 1}.svg?alt=media&token=c9029d17-018d-4cbb-9696-976520720b94",
                          soundPath:
                              "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/sound1%2FL1${index + 1}.wav?alt=media&token=a7dc3455-7626-41c9-8cae-fbb7be8592d6");
                    },
                    // childCount:,
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
        });
      }
    })

        // FutureBuilder<dynamic>(
        //     future: getfile(),
        //     builder: (BuildContext context, AsyncSnapshot fsnapshot) {
        //       // final files = fsnapshot?.data;
        //       if (fsnapshot.hasError) {
        //         return Container(
        //           child: Center(
        //             child: Text(fsnapshot.error.toString()),
        //           ),
        //         );
        //       }
        //
        //       return Directionality(
        //         textDirection: TextDirection.rtl,
        //         child: CustomScrollView(
        //           slivers: <Widget>[
        //             ///First sliver is the App Bar
        //             SliverAppBar(
        //               backgroundColor: kGreenLightColor,
        //               title: MyAppBar(
        //                 Icon(
        //                   Icons.ac_unit,
        //                   size: 25,
        //                 ),
        //                 () {},
        //               ),
        //               pinned: true,
        //               expandedHeight: 230,
        //               flexibleSpace: FlexibleSpaceBar(
        //                 background: MyFlexibleAppBar(
        //                   Padding(
        //                     padding: const EdgeInsets.only(bottom: 8.0),
        //                     child: Image.asset('assets/images/bismillah.png',
        //                         width: 80),
        //                   ),
        //                   Stack(
        //                     alignment: Alignment.center,
        //                     children: [
        //                       Image.asset(
        //                         'assets/texture/lessonTexture.png',
        //                         width: 310,
        //                       ),
        //                       SvgPicture.network(
        //                         "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/text1%2F0.svg?alt=media&token=c9029d17-018d-4cbb-9696-976520720b94",
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ),
        //
        //             SliverGrid(
        //               delegate: SliverChildBuilderDelegate(
        //                 (context, index) {
        //                   return CustomWordCard(
        //                       word:
        //                           "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/text1%2F${index + 1}.svg?alt=media&token=c9029d17-018d-4cbb-9696-976520720b94",
        //                       soundPath:
        //                           "https://firebasestorage.googleapis.com/v0/b/shafique-academy.appspot.com/o/sound1%2FL1${index + 1}.wav?alt=media&token=a7dc3455-7626-41c9-8cae-fbb7be8592d6");
        //                 },
        //                 childCount: 29,
        //               ),
        //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //                 // mainAxisExtent: 70,
        //                 crossAxisCount: 3,
        //                 mainAxisSpacing: 10,
        //                 crossAxisSpacing: 5,
        //                 childAspectRatio: 1.0,
        //               ),
        //             ),
        //           ],
        //         ),
        //       );
        //       //  else {
        //       //   print("snapshot: ${fsnapshot.data}");
        //       //   return Center(
        //       //     child: Container(
        //       //       child: CircularProgressIndicator(),
        //       //     ),
        //       //   );
        //       // }
        //     })),
        ));
  }
}

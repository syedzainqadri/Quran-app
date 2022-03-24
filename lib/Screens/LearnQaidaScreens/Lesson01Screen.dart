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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      lessonController.getLessons("text1/");
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Obx(() {
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

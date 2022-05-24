import 'package:flutter/material.dart';
import 'package:quranapp/Utilities/constants.dart';
import 'package:quranapp/Utilities/youtubeController.dart';
import 'package:quranapp/Widgets/CustomTabButton.dart';
import 'package:quranapp/Widgets/CustomTabChild.dart';

class TabSceern extends StatefulWidget {
  final String title;
  TabSceern({@required this.title});
  @override
  _TabSceernState createState() => _TabSceernState();
}

class _TabSceernState extends State<TabSceern> {
  // YoutubeController youtubeController = YoutubeController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          elevation: 0,
          backgroundColor: kGreenLightColor,
          bottom: TabBar(
            unselectedLabelStyle: TextStyle(
              color: Colors.white,
            ),
            unselectedLabelColor: kGoldenColor,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(
                  30,
                )),
            tabs: [
              Tab(
                child: TabButton(
                  text: 'Video',
                ),
              ),
              Tab(
                child: TabButton(
                  text: 'Image',
                ),
              )
            ],
          ),
        ),
        body: Container(
          color: kGreenLightColor,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(
                    30,
                  ),
                ),
                color: Colors.white,
              ),
              child: TabBarView(
                children: [
                  // TabChild(
                  //   contentText:
                  //       "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                  //   title: 'Title',
                  // child: YoutubePlayer(
                  //   controller: youtubeController.controller,
                  //   showVideoProgressIndicator: true,
                  //   progressIndicatorColor: Colors.blueAccent,
                  // ),
                  // ),
                  TabChild(
                    contentText:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                    title: 'Title',
                    child: Image.asset(
                      'images/image2.jpg',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",

// @required YoutubePlayerController controller,

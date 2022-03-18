import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:quranapp/Utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();

  final List<Widget> entries = [
    Custom_Card(
      onPres: () {},
      imagePath: 'assets/images/quran.png',
      title: 'Learn Qaida',
    ),
    Custom_Card(
      onPres: () {},
      imagePath: 'assets/images/muslim.png',
      title: 'Sunnah',
    ),
    Custom_Card(
      onPres: () {},
      imagePath: 'assets/images/praying.png',
      title: 'Learn Pray',
    ),
    Custom_Card(
      onPres: () {},
      imagePath: 'assets/images/story.png',
      title: 'Stories',
    ),
    Custom_Card(
      onPres: () {},
      imagePath: 'assets/images/story.png',
      title: 'Stories',
    ),
    Custom_Card(
      onPres: () {},
      imagePath: 'assets/images/story.png',
      title: 'Stories',
    ),
    Custom_Card(
      onPres: () {},
      imagePath: 'assets/images/story.png',
      title: 'Stories',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final double dWidth = MediaQuery.of(context).size.width;
    final double dHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: Drawer(),
        // appBar: AppBar(
        //   title: Text("Transparent AppBar"),
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   actions: [
        //     IconButton(
        //       icon: Icon(Icons.share),
        //       onPressed: () {},
        //       tooltip: 'Share',
        //     ),
        //   ],
        // ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff0F2616),
                  Color(0xff00472F),
                  Color(0xff004D39),
                  Color(0xff004E3C),
                ],
              ),
            ),
            child: Stack(
              children: [
                Image.asset(
                  'assets/texture/texture1.png',
                  width: double.infinity,
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: Icon(
                                  Icons.menu,
                                  color: kLightColor,
                                  size: 30,
                                ),
                              ),
                              GestureDetector(
                                child: Icon(
                                  Icons.info,
                                  color: kLightColor,
                                  size: 30,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 80),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/logo.png',
                                width: dHeight * 0.15,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                  color: kLightColor,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(3, 3),
                                      blurRadius: 50,
                                      color: kDarkColor.withOpacity(0.25),
                                    )
                                  ],
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Search',
                                      hintStyle:
                                          TextStyle(color: kGreenLightColor),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      suffixIcon: Icon(Icons.search)),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      children: entries,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Custom_Card extends StatelessWidget {
  const Custom_Card(
      {@required this.imagePath, @required this.title, this.onPres});

  final String imagePath;
  final String title;
  final Function onPres;

  @override
  Widget build(BuildContext context) {
    final double dWidth = MediaQuery.of(context).size.width;
    final double dHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onPres,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: dWidth / 2.4,
          height: dWidth / 2.3,
          decoration: BoxDecoration(
            color: kLightColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                color: kGoldenColor.withOpacity(0.8),
                offset: Offset(2, 2),
                blurRadius: 0,
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 5,
                  left: 5,
                  child:
                      Image.asset('assets/images/ptrnTopLeft.png', width: 40)),
              Positioned(
                  top: 5,
                  right: 5,
                  child:
                      Image.asset('assets/images/ptrnTopRight.png', width: 40)),
              Positioned(
                  bottom: 5,
                  right: 5,
                  child: Image.asset('assets/images/ptrnBottomRight.png',
                      width: 40)),
              Positioned(
                  bottom: 5,
                  left: 5,
                  child: Image.asset('assets/images/ptrnBottomLeft.png',
                      width: 40)),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        imagePath,
                        height: 80,
                        color: kGoldenColor,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          color: kDarkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

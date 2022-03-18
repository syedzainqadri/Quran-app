import 'package:flutter/material.dart';
import 'package:quranapp/Screens/homeScreen.dart';
import 'package:quranapp/Screens/LearnQaidaScreens/learnQaida.dart';
import 'package:quranapp/Screens/PrayerScreens/prayersScreen.dart';
import 'package:quranapp/Screens/storiesScreen.dart';
import 'package:quranapp/Screens/sunnahScreens/sunnahScreen.dart';
import 'package:quranapp/Utilities/constants.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedItem = 0;

  final List<Widget> _children = [
    LearnQaida(),
    SunnahScreen(),
    Prayers(),
    StoriesScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CustomNavBar(
      //   onChange: (val) {
      //     setState(() {
      //       _selectedItem = val;
      //     });
      //   },
      //   defaultSelectedIndex: 0,
      // ),
      body: _children[_selectedItem],
      // body: Center(
      //   child: Text('Selected Screen index is $_selectedItem'),
      // ),
    );
  }
}

class CustomNavBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  CustomNavBar({this.defaultSelectedIndex = 0, @required this.onChange});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.defaultSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    final double dWidth = MediaQuery.of(context).size.width;
    final double dHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        buildNavBarItems(
          dWidth,
          dHeight,
          0,
          'assets/images/quran.png',
          'Qaida',
        ),
        buildNavBarItems(
          dWidth,
          dHeight,
          1,
          'assets/images/muslim.png',
          'Sunnah',
        ),
        buildNavBarItems(
          dWidth,
          dHeight,
          2,
          'assets/images/praying.png',
          'Prayer',
        ),
        buildNavBarItems(
          dWidth,
          dHeight,
          3,
          'assets/images/story.png',
          'Stories',
        ),
        buildNavBarItems(
          dWidth,
          dHeight,
          4,
          'assets/images/qaida.png',
          'More',
        ),
      ],
    );
  }

  Widget buildNavBarItems(
    double dWidth,
    double dHeight,
    int index,
    String path,
    String title,
  ) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
          height: dWidth * 0.15,
          width: dWidth / 5,
          decoration: index == _selectedIndex
              ? BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 4,
                      color: kGreenDarkColor,
                    ),
                  ),
                  color:
                      index == _selectedIndex ? kGreenLightColor : kLightColor,
                )
              : BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                path,
                width: index == _selectedIndex ? 30 : 20,
                color: index == _selectedIndex ? kGoldenColor : Colors.grey,
              ),
              Text(
                title,
                style: TextStyle(
                  color: index == _selectedIndex ? kGoldenColor : Colors.grey,
                ),
              ),
            ],
          )),
    );
  }
}

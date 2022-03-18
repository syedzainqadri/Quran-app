import 'package:flutter/material.dart';
import 'package:quranapp/Utilities/constants.dart';

class MyAppBar extends StatelessWidget {
  final barHeight = 66.0;
  final Widget myIcon;
  final Function onPress;

  const MyAppBar(this.myIcon, this.onPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                ' ',
                style: TextStyle(
                  fontSize: 20,
                  color: kLightColor,
                ),
              ),
            ),
          ),
          IconButton(icon: myIcon, onPressed: onPress),
        ],
      ),
    );
  }
}

class MyFlexibleAppBar extends StatelessWidget {
  final double appBarHeight = 66.0;
  final Widget widgetOne;
  final Widget widgetTwo;

  const MyFlexibleAppBar(this.widgetOne, this.widgetTwo);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/texture/texture1.png',
          ),
          fit: BoxFit.cover,
        ),
        gradient: LinearGradient(
          colors: [
            Color(0xff00472F),
            Color(0xff004D39),
            Color(0xff004E3C),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      child: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            widgetOne,
            widgetTwo,
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

class CustomFlexibleAppBar extends StatelessWidget {
  final double appBarHeight = 66.0;
  final Widget widgetOne;

  CustomFlexibleAppBar({this.widgetOne});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/texture/texture1.png',
          ),
          fit: BoxFit.cover,
        ),
        gradient: LinearGradient(
          colors: [
            Color(0xff00472F),
            Color(0xff004D39),
            Color(0xff004E3C),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      child: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            widgetOne,
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

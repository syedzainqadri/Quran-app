import 'package:flutter/material.dart';
import 'package:quranapp/Utilities/SliverWidgets.dart';
import 'package:quranapp/Utilities/constants.dart';
import 'package:quranapp/Utilities/listSunnah.dart';

class SunnahScreen extends StatefulWidget {
  @override
  _SunnahScreenState createState() => _SunnahScreenState();
}

class _SunnahScreenState extends State<SunnahScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: kGreenLightColor,
            // title: MyAppBar(
            //   Icon(
            //     Icons.ac_unit,
            //     size: 25,
            //   ),
            //   () {},
            // ),
            pinned: true,
            expandedHeight: 240,
            flexibleSpace: FlexibleSpaceBar(
                background: CustomFlexibleAppBar(
              widgetOne:
                  Image.asset('assets/images/sunnatHeader.png', width: 230),
            )),
          ),
          SliverToBoxAdapter(
              child: Wrap(
            alignment: WrapAlignment.center,
            children: sunnahList,
          ))
        ],
      ),
    ));
  }
}
// Image.asset('assets/images/sunnatHeader.png', width: 230),

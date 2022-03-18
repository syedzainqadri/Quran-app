import 'package:flutter/material.dart';
import 'package:quranapp/Utilities/SliverWidgets.dart';
import 'package:quranapp/Utilities/constants.dart';
import 'package:quranapp/Utilities/listSunnah.dart';

class Prayers extends StatefulWidget {
  @override
  _PrayersState createState() => _PrayersState();
}

class _PrayersState extends State<Prayers> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
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
                  Image.asset('assets/images/madaniqaida.png', width: 180),
                  Image.asset('assets/images/ayat01.png', width: 300),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Wrap(
              children: sunnahList,
            ))
          ],
        ),
      ),
    );
  }
}

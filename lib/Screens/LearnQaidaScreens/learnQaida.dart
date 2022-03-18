import 'package:flutter/material.dart';
import 'package:quranapp/Utilities/constants.dart';
import 'package:quranapp/Utilities/listLearnQaida.dart';

class LearnQaida extends StatefulWidget {
  @override
  _LearnQaidaState createState() => _LearnQaidaState();
}

class _LearnQaidaState extends State<LearnQaida> {
  @override
  Widget build(BuildContext context) {
    final double dWidth = MediaQuery.of(context).size.width;
    final double dHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // drawer: Drawer(),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: gradientColors,
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
                      children: learnQaidaScreenList,
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

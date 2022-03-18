import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quranapp/Model/OnbordingModel.dart';
import 'package:quranapp/Screens/landingPage.dart';
import 'package:quranapp/Utilities/constants.dart';

class Onbording extends StatefulWidget {
  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  PageController _controller;
  final box = Hive.box(DB_lesson);
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double dWidth = MediaQuery.of(context).size.width;
    final double dHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
            'assets/texture/textureAlif.png',
          ))),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: onBordingData.length,
                  onPageChanged: (int index) {
                    if (onBordingData.length == (index + 1)) {
                      box.put("intro", true);
                    }
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            onBordingData[i].title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              // vertical: 20,
                            ),
                            child: Text(
                              onBordingData[i].discription,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              // vertical: 10,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                onBordingData[i].image,
                                width: 250,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onBordingData.length,
                      (index) => buildDot(index, context),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: currentIndex ==
                        onBordingData.length - onBordingData.length
                    ? IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                        ),
                        onPressed: () {
                          if (currentIndex == 0) {
                            _controller.nextPage(
                              duration: Duration(microseconds: 100),
                              curve: Curves.bounceIn,
                            );
                          }
                        },
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                            ),
                            onPressed: () {
                              // print()
                              _controller.previousPage(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.bounceInOut,
                              );
                            },
                          ),
                          IconButton(
                            icon: currentIndex == onBordingData.length - 1
                                ? Icon(
                                    Icons.check,
                                  )
                                : Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              print(currentIndex);
                              if (currentIndex == onBordingData.length - 1) {
                                print('nextPage');
                                box.put("intro", true);

                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => LandingPage(),
                                    ),
                                    (route) => false);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (_) => LandingPage(),
                                //   ),
                                // );
                              } else {
                                _controller.nextPage(
                                  duration: Duration(microseconds: 100),
                                  curve: Curves.bounceIn,
                                );
                              }
                            },
                          ),
                        ],
                      ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 20 : 10,
      margin: EdgeInsets.only(
        right: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kGreenDarkColor,
      ),
    );
  }
}

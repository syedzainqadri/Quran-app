import 'package:flutter/material.dart';
import 'package:quranapp/Utilities/constants.dart';

class Custom_Card extends StatelessWidget {
  const Custom_Card(
      {@required this.imagePath, @required this.title, this.screenName});

  final String imagePath;
  final String title;
  final Widget screenName;

  @override
  Widget build(BuildContext context) {
    final double dWidth = MediaQuery.of(context).size.width;
    final double dHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => screenName,
          ),
        );
      },
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
                        height: 70,
                        // color: kGoldenColor,
                      ),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: kDarkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
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

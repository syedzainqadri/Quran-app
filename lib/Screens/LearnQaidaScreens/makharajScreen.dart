import 'package:flutter/material.dart';

class MakharajScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
        children: [
          SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                // height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/texture/textureAlif.png'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      color: Colors.grey.withOpacity(0.8),
                      offset: Offset(2, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Image.asset('assets/images/articulators.png'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  color: Colors.grey.withOpacity(0.8),
                  offset: Offset(2, 2),
                  blurRadius: 5,
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/Mukhrij-1.jpg',
                scale: 1,
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      )

          // body: Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Container(
          //         // height: MediaQuery.of(context).size.height,
          //         margin: EdgeInsets.symmetric(horizontal: 15),
          //         decoration: BoxDecoration(
          //           image: DecorationImage(
          //             image: AssetImage('assets/texture/textureAlif.png'),
          //           ),
          //           borderRadius: BorderRadius.circular(20),
          //           boxShadow: [
          //             BoxShadow(
          //               spreadRadius: 2,
          //               color: Colors.grey.withOpacity(0.8),
          //               offset: Offset(2, 2),
          //               blurRadius: 5,
          //             ),
          //           ],
          //         ),
          //         child: Image.asset('assets/images/articulators.png'),
          //       ),
          //     ],
          //   ),
          // ),
          ),
    );
  }
}

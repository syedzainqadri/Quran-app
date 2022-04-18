import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quranapp/Utilities/constants.dart';

showInstructionDialog({int itemLength, String url, context, instructions}) {
  showDialog(
    useSafeArea: true,
    context: context,
    // barrierDismissible: controller.canDissmisse.value,
    barrierDismissible: true,
    barrierColor: kGreenColor.withOpacity(0.3),

    builder: (builder) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        titlePadding: EdgeInsets.symmetric(horizontal: 15),
        content: Container(
          padding: EdgeInsets.all(15.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: itemLength,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  // height: 100,
                  margin: EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  child: SvgPicture.network(
                    "$url${index + 1}.svg?alt=media&token=46011e92-dfce-49e7-9972-0e1cdf195d5b",
                    placeholderBuilder: (context) => Icon(Icons.image),
                    // fit: BoxFit.cover,
                  ),
                );
              }),
        ),
      );
    },
  );
}

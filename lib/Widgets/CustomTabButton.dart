import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String text;
  TabButton({@required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(),
      ),
    );
  }
}

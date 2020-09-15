
import 'package:flutter/material.dart';

class IntraText extends StatelessWidget {

  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  IntraText(this.text, this.color, this.fontSize, this.fontWeight);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize
      ),
    );
  }
}

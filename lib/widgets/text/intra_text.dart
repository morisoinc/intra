
import 'package:flutter/material.dart';

class IntraText extends StatelessWidget {

  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  IntraText(this.text, this.color, this.fontSize, this.fontWeight, {this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
//    return Expanded(
//        child: Text(
//          text,
//          style: TextStyle(
//              fontWeight: fontWeight,
//              color: color,
//              fontSize: fontSize
//          ),
//          maxLines: 5,
//          overflow: TextOverflow.visible,
//        )
//    );
    return Text(
      text,
      style: TextStyle(
          fontWeight: fontWeight,
          color: color,
          fontSize: fontSize
      ),
      maxLines: 5,
      textAlign: textAlign,
    );
  }
}

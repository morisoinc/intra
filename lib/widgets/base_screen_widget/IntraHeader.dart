import 'package:flutter/material.dart';

class IntraHeader extends StatelessWidget {
  final bool showCurvedBackground;
  final Widget child;

  IntraHeader(this.showCurvedBackground, this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: !showCurvedBackground ? child : Container(

      ),
    );
  }
}


class CurvedBackground extends CustomPainter {

  final double height;

  CurvedBackground(this.height);

  @override
  void paint(Canvas canvas, Size size) {

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {

  }
}
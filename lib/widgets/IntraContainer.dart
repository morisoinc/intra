

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intra/meta/intraSpacing/margin.dart';
import 'package:intra/theme.dart';

class IntraContainer extends StatelessWidget {

  final Widget child;
  
  IntraContainer(this.child);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        decoration: new BoxDecoration(color: white3),
        child: CustomPaint(
          painter: DottedBackground(),
          child: Container(
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    IntraMargin.horizontalMargin,
                    IntraMargin.verticalMargin,
                    IntraMargin.horizontalMargin,
                    IntraMargin.verticalMargin
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class DottedBackground extends CustomPainter {

  static final offsets = [];
  static final brush = Paint()
    ..color =Color(0xFFBBBBBB)
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    List<Offset> offsets = List();

    // var finalprint = '';

    for (var i = 0; i < 27; i++) {
      for (var j = 0; j < 50; j++) {
        offsets.add(Offset(i*15.0, j*15.0));
        // finalprint += "Offset(${i*15.0}, ${j*15.0}), ";
      }
      // finalprint += "\n";
    }

    canvas.drawPoints(PointMode.points, offsets, brush);
  }

  @override bool shouldRepaint(CustomPainter oldDelegate) => false;
}
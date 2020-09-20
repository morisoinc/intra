import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intra/meta/intraSpacing/margin.dart';
import 'package:intra/theme.dart';
import 'package:intra/widgets/base_screen_widget/IntraHeader.dart';

class IntraContainer extends StatelessWidget {
  final Widget header;
  final Widget body;
  final bool showHeader;

  IntraContainer(this.header, this.body, {this.showHeader = true});

  static const headerPadding = EdgeInsets.fromLTRB(IntraMargin.horizontalMargin,
      IntraMargin.verticalMargin, IntraMargin.horizontalMargin, 0.0);

  static const bodyPadding = EdgeInsets.fromLTRB(IntraMargin.horizontalMargin,
      0.0, IntraMargin.horizontalMargin, IntraMargin.verticalMargin);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        decoration: new BoxDecoration(color: white3),
        child: CustomPaint(
          painter: DottedBackground(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
          ),
          child: Container(
            child: Column(
              children: [
                IntraHeader(
                  showHeader,
                  SafeArea(
                    child: Container(
                      padding: headerPadding,
                      child: header,
                    ),
                  ),
                ),
                Container(
                  padding: bodyPadding,
                  child: body,
                ),
              ],
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
    ..color = Color(0xFFDCDCDC)
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 2;

  final double screenWidth;
  final double screenHeight;

  DottedBackground(this.screenWidth, this.screenHeight);

  @override
  void paint(Canvas canvas, Size size) {
    List<Offset> offsets = List();

    for (var i = 0; i < screenWidth; i += 15) {
      for (var j = 0; j < screenHeight; j += 15) {
        offsets.add(Offset(i + .0, j + .0));
      }
    }

    canvas.drawPoints(PointMode.points, offsets, brush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

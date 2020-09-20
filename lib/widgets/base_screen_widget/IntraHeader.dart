import 'package:flutter/material.dart';

import '../../theme.dart';

class IntraHeader extends StatelessWidget {
  final bool showCurvedBackground;
  final Widget child;

  IntraHeader(this.showCurvedBackground, this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: !showCurvedBackground ? child : CustomPaint(
        painter: CurvedBackground(MediaQuery.of(context).size.height, 228),
        child: child,
      ),
    );
  }
}


class CurvedBackground extends CustomPainter {

  static final brush = Paint()
    ..color = purple4;

  final double height;
  final double width;

  CurvedBackground(this.height, this.width);

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromPoints(Offset.zero, Offset(height, width));
    canvas.drawRect(rect, brush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
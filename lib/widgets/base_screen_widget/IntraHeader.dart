import 'dart:ui';

import 'package:flutter/material.dart';

import '../../theme.dart';

class IntraHeader extends StatefulWidget {
  final Widget child;
  final backgroundStyle bgStyle;

  IntraHeader(this.bgStyle, this.child);

  @override
  State createState() => _IntraHeaderState(bgStyle, child);
}

class _IntraHeaderState extends State<IntraHeader> {
  final GlobalKey _headerKey = GlobalKey();

  final Widget child;
  final bgStyle;

  Size headerSize = Size(0, 0);

  _IntraHeaderState(this.bgStyle, this.child);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => (getHeaderSize()));
  }

  getHeaderSize() {
    RenderBox _header = _headerKey.currentContext.findRenderObject();
    headerSize = _header.size;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: bgStyle == backgroundStyle.none
          ? child
          : Container(
              key: _headerKey,
              child: CustomPaint(
                painter: bgStyle == backgroundStyle.curved
                    ? CurvedBackground(
                        headerSize.height, MediaQuery.of(context).size.width)
                    : DoubleTranslucentRectangleBackground(
                        MediaQuery.of(context).size.width),
                child: child,
              ),
            ),
    );
  }
}

enum backgroundStyle {
  none,
  curved,
  translucentRectangles,
}

class CurvedBackground extends CustomPainter {
  static final brush = Paint()..color = purple4;
  static final curveRadius = 48.0;

  final double height;
  final double width;

  CurvedBackground(this.height, this.width);

  @override
  void paint(Canvas canvas, Size size) {
    if (height == 0.0) return;

    var path = Path();

    path.moveTo(0, height + curveRadius);
    path.quadraticBezierTo(0, height, curveRadius, height);
    path.lineTo(width - curveRadius, height);
    path.quadraticBezierTo(width, height, width, height - curveRadius);
    path.lineTo(width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, brush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class DoubleTranslucentRectangleBackground extends CustomPainter {
  static final purpleBrush = Paint()..color = Color(0x33AE6CF8);
  static final blueBrush = Paint()..color = Color(0x33459CFF);
  static final curveRadius = 36.0;
  static final purpleRectangleHeight = 92.0;
  static final blueRectangleHeight = 2.0;
  static final rectangleSpacing = 8.0;

  final double width;

  DoubleTranslucentRectangleBackground(this.width);

  @override
  void paint(Canvas canvas, Size size) {
    if (width == 0) return;

    var path = Path();
    path.moveTo(width / 2, 0);
    path.lineTo(width / 2, purpleRectangleHeight / 1.8);
    path.quadraticBezierTo(
        width / 2, purpleRectangleHeight, width / 2 + curveRadius, purpleRectangleHeight);
    path.lineTo(width, purpleRectangleHeight);
    path.lineTo(width, 0);
    path.lineTo(width / 2, 0);

    canvas.drawPath(path, purpleBrush);

    path = Path();
    path.moveTo(width - width / 4, purpleRectangleHeight + rectangleSpacing);
    path.lineTo(width - width / 4, purpleRectangleHeight + rectangleSpacing + blueRectangleHeight);
    path.quadraticBezierTo(
        width - width / 4, purpleRectangleHeight + rectangleSpacing + blueRectangleHeight + curveRadius,
        width - width / 4 + curveRadius, purpleRectangleHeight + rectangleSpacing + blueRectangleHeight + curveRadius);
    path.lineTo(width, purpleRectangleHeight + rectangleSpacing + blueRectangleHeight + curveRadius);
    path.lineTo(width, purpleRectangleHeight + rectangleSpacing);
    path.lineTo(width - width / 4, purpleRectangleHeight + rectangleSpacing);

    canvas.drawPath(path, blueBrush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

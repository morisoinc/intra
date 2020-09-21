import 'dart:ui';

import 'package:flutter/material.dart';

import '../../theme.dart';

class IntraHeader extends StatefulWidget {
  final bool showCurvedBackground;
  final Widget child;

  IntraHeader(this.showCurvedBackground, this.child);

  @override
  State createState() => _IntraHeaderState(showCurvedBackground, child);
}

class _IntraHeaderState extends State<IntraHeader> {
  final GlobalKey _headerKey = GlobalKey();

  final bool showCurvedBackground;
  final Widget child;

  Size headerSize = Size(0, 0);

  _IntraHeaderState(this.showCurvedBackground, this.child);

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
      child: !showCurvedBackground
          ? child
          : Container(
              key: _headerKey,
              child: CustomPaint(
                painter: CurvedBackground(
                    headerSize.height, MediaQuery.of(context).size.width),
                child: child,
              ),
            ),
    );
  }
}

class CurvedBackground extends CustomPainter {
  static final brush = Paint()..color = purple4;

  final double height;
  final double width;

  CurvedBackground(this.height, this.width);

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromPoints(Offset.zero, Offset(width, height));
    canvas.drawRect(rect, brush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
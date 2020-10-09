import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intra/meta/intraSpacing/margin.dart';
import 'package:intra/widgets/button/intra_back_button.dart';
import 'package:intra/widgets/text/intra_page_subtitle_text.dart';

import '../../theme.dart';

class IntraHeader extends StatefulWidget {
  final Widget child;
  final backgroundStyle bgStyle;
  final Function onBackPressed;
  final String title;
  final Image backgroundImage;

  IntraHeader(
    this.bgStyle,
    this.child, {
    this.onBackPressed,
    this.title,
    this.backgroundImage,
  }) {
    createState();
  }

  @override
  State createState() {
    return _IntraHeaderState(bgStyle, child,
        onBackPressed: onBackPressed,
        title: title,
    );
  }
}

class _IntraHeaderState extends State<IntraHeader> {
  final GlobalKey _headerKey = GlobalKey();

  final Widget child;
  final bgStyle;
  final Function onBackPressed;
  final String title;

  Size headerSize = Size(0, 0);

  _IntraHeaderState(
    this.bgStyle,
    this.child, {
    this.onBackPressed,
    this.title,
  });

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => (getHeaderSize()));
  }

  getHeaderSize() {
    if (widget.backgroundImage != null) {
      print('BACKGROUND IMAGE IS NOT NULL');
      headerSize = Size(MediaQuery.of(context).size.width, 350);
    } else {
      RenderBox _header = _headerKey.currentContext.findRenderObject();
      headerSize = _header.size;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: bgStyle == backgroundStyle.none
          ? HeaderItself(
              child: child,
              onBackPressed: onBackPressed,
              isBackgroundLight: true,
              title: title,
              image: widget.backgroundImage,
            )
          : Container(
              key: _headerKey,
              child: CustomPaint(
                painter: bgStyle == backgroundStyle.curved
                    ? CurvedBackground(
                        headerSize.height, MediaQuery.of(context).size.width)
                    : DoubleTranslucentRectangleBackground(
                        MediaQuery.of(context).size.width),
                child: HeaderItself(
                  child: child,
                  onBackPressed: onBackPressed,
                  title: title,
                  image: widget.backgroundImage,
                  isBackgroundLight:
                      bgStyle == backgroundStyle.translucentRectangles,
                ),
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

class HeaderItself extends StatelessWidget {
  final Widget child;
  final Function onBackPressed;
  final bool isBackgroundLight;
  final String title;
  final Image image;

  static const headerPadding = EdgeInsets.fromLTRB(IntraMargin.horizontalMargin,
      IntraMargin.verticalMargin, IntraMargin.horizontalMargin, IntraMargin.verticalMargin);

  static const childPadding = EdgeInsets.fromLTRB(0, 40, 0, 0);
  static const lonelyTitlePadding = EdgeInsets.fromLTRB(0, 11, 0, 11);
  static const popularTitlePadding = EdgeInsets.fromLTRB(15, 0, 0, 0);

  HeaderItself(
      {this.child,
      this.onBackPressed,
      this.isBackgroundLight = false,
      this.title,
      this.image});

  @override
  Widget build(BuildContext context) {
    if (image == null && onBackPressed == null && title == null) {
      return SafeArea(
        bottom: false,
        child: Padding(
          padding: headerPadding,
          child: child,
        ),
      );
    } else if (image == null && onBackPressed == null) {
      return SafeArea(
        bottom: false,
        child: Padding(
          padding: headerPadding,
          child: Column(
            children: [
              Padding(
                padding: lonelyTitlePadding,
                child: IntraPageSubtitleText(title, color: white1),
              ),
              Padding(
                padding: childPadding,
                child: child,
              ),
            ],
          ),
        ),
      );
    } else if (image == null && title == null) {
      return SafeArea(
        bottom: false,
        child: Padding(
          padding: headerPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntraBackButton(
                onBackPressed,
                translucent: !isBackgroundLight,
              ),
              Padding(
                padding: childPadding,
                child: child,
              )
            ],
          ),
        ),
      );
    } else if (image == null) {
      return SafeArea(
        bottom: false,
        child: Padding(
          padding: headerPadding,
          child: Column(
            children: [
              Row(
                children: [
                  IntraBackButton(
                    onBackPressed,
                    translucent: !isBackgroundLight,
                  ),
                  Padding(
                    padding: popularTitlePadding,
                    child: IntraPageSubtitleText(title, color: white1),
                  ),
                ],
              ),
              Padding(
                padding: childPadding,
                child: child,
              )
            ],
          ),
        ),
      );
    } else if (onBackPressed == null && title == null) {
      return image;
    } else if (onBackPressed == null) {
      return child;
    } else {
      return Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Opacity(
              child: FittedBox(
                fit: BoxFit.fill,
                child: image,
              ),
              opacity: .5,
            ),
          ),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: headerPadding,
              child: Column(
                children: [
                  Row(
                    children: [
                      IntraBackButton(
                        onBackPressed,
                        translucent: !isBackgroundLight,
                      ),
                      Padding(
                        padding: popularTitlePadding,
                        child: IntraPageSubtitleText(title, color: white1),
                      ),
                    ],
                  ),
                  Padding(
                    padding: childPadding,
                    child: child,
                  )
                ],
              ),
            ),
          ),
        ],
      );
    }
  }
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
    path.quadraticBezierTo(width / 2, purpleRectangleHeight,
        width / 2 + curveRadius, purpleRectangleHeight);
    path.lineTo(width, purpleRectangleHeight);
    path.lineTo(width, 0);
    path.lineTo(width / 2, 0);

    canvas.drawPath(path, purpleBrush);

    path = Path();
    path.moveTo(width - width / 4, purpleRectangleHeight + rectangleSpacing);
    path.lineTo(width - width / 4,
        purpleRectangleHeight + rectangleSpacing + blueRectangleHeight);
    path.quadraticBezierTo(
        width - width / 4,
        purpleRectangleHeight +
            rectangleSpacing +
            blueRectangleHeight +
            curveRadius,
        width - width / 4 + curveRadius,
        purpleRectangleHeight +
            rectangleSpacing +
            blueRectangleHeight +
            curveRadius);
    path.lineTo(
        width,
        purpleRectangleHeight +
            rectangleSpacing +
            blueRectangleHeight +
            curveRadius);
    path.lineTo(width, purpleRectangleHeight + rectangleSpacing);
    path.lineTo(width - width / 4, purpleRectangleHeight + rectangleSpacing);

    canvas.drawPath(path, blueBrush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

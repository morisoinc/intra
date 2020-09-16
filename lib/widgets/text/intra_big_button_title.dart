

import 'package:flutter/cupertino.dart';
import 'package:intra/meta/intraTextStyles/text_style_big_button_title.dart';
import 'package:intra/theme.dart';
import 'package:intra/widgets/text/intra_text.dart';

class IntraBigButtonTitle extends StatelessWidget {
  final String text;
  final Color color;
  final style = TextStyleBigButtonTitle();

  IntraBigButtonTitle(this.text, {this.color = black2});

  @override
  Widget build(BuildContext context) {
    return IntraText(
      text,
      color,
      style.fontSize,
      style.fontWeight,
    );
  }
}
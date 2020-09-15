

import 'package:flutter/cupertino.dart';
import 'package:intra/meta/intraTextStyles/TextStylePageTitle.dart';
import 'package:intra/theme.dart';
import 'package:intra/widgets/IntraText.dart';

class IntraPageTitleText extends StatelessWidget {
  final String text;
  final Color color;
  final style = TextStylePageTitle();

  IntraPageTitleText(this.text, {this.color = black2});

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
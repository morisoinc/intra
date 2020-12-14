import 'package:flutter/material.dart';
import 'package:intra/meta/intraTextStyles/text_style_auxiliary_button.dart';

import '../../theme.dart';
import 'intra_text.dart';

class IntraSquaredTagText extends StatelessWidget {
  final String text;
  final String boldSubtext;
  final int boldSubtextIndex;
  final Color color = purple4;
  final style = TextStyleAuxiliaryButton();

  IntraSquaredTagText(this.text, this.boldSubtext)
      : boldSubtextIndex = text.indexOf(boldSubtext);

  @override
  Widget build(BuildContext context) {
    return IntraText(
      text,
      color,
      style.fontSize,
      style.fontWeight,
      textAlign: TextAlign.center,
    );
    // return boldSubtextIndex > -1 ? RichText(
    //   text: new TextSpan(
    //     style: TextStyle(
    //       fontSize: style.fontSize,
    //       color: color,
    //       fontWeight: style.fontWeight,
    //     ),
    //     children: [
    //       TextSpan()
    //     ],
    //   ),
    // ) : IntraText(
    //   text,
    //   color,
    //   style.fontSize,
    //   style.fontWeight,
    // );
  }
}

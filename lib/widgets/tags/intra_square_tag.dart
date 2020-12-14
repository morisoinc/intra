import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intra/widgets/text/intra_squared_tag_text.dart';

import '../../theme.dart';

class IntraSquareTag extends StatelessWidget {

  final String text;
  final String boldSubtext;
  final String iconPath;

  IntraSquareTag(this.text, this.boldSubtext, this.iconPath);



  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 80,
        width: 105,
        padding: EdgeInsets.fromLTRB(7, 13, 7, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: purple1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath, width: 25, height: 25,),
            IntraSquaredTagText(text, boldSubtext),
          ],
        ),
      ),
    );
  }
}

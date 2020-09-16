

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intra/widgets/text/intra_big_button_subtitle.dart';
import 'package:intra/widgets/text/intra_big_button_title.dart';

import '../../theme.dart';

class IntraSplitPillButton extends StatelessWidget {

  final String leftTitle;
  final String leftSubtitle;
  final String rightTitle;
  final String rightSubtitle;

  IntraSplitPillButton(this.leftTitle, this.leftSubtitle, this.rightTitle, this.rightSubtitle);

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
              color: yellow2
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(21, 15, 0, 15),
              child: Row(
                children: [
                  SvgPicture.asset('assets/navbar_selected_home.svg'),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IntraBigButtonTitle(leftTitle),
                      IntraBigButtonSubtitle(leftSubtitle, color: black1),
                    ],
                  )
                ],
              ),
            )
          ),
        ),
        SizedBox(width: 4),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                color: yellow2
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(21, 15, 0, 15),
              child: Row(
                children: [
                  SvgPicture.asset('assets/navbar_selected_notifications.svg'),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IntraBigButtonTitle(rightTitle),
                      IntraBigButtonSubtitle(rightSubtitle, color: black1),
                    ],
                  )
                ],
              )
            )
          ),
        ),
      ],
    );
  }
}
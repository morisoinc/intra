import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intra/theme.dart';
import 'package:intra/widgets/text/intra_big_button_subtitle.dart';
import 'package:intra/widgets/text/intra_big_button_title.dart';

class IntraBigMainButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onTap;

  IntraBigMainButton(this.title, this.subtitle, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: white1,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 8), // changes position of shadow
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 15, 15),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IntraBigButtonTitle(title),
                                IntraBigButtonSubtitle(subtitle, color: black1),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(
                        'assets/icon_right_arrow_purple4.svg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

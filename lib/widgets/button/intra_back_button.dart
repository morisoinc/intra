import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intra/theme.dart';
import 'package:intra/widgets/text/intra_big_button_subtitle.dart';
import 'package:intra/widgets/text/intra_big_button_title.dart';

class IntraBackButton extends StatelessWidget {
  final Function onTap;

  IntraBackButton(this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset('assets/icon_back_button_gray.svg')
    );
  }
}

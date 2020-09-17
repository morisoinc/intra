

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intra/meta/intraSpacing/margin.dart';
import 'package:intra/theme.dart';

class IntraContainer extends StatelessWidget {

  final Widget child;
  
  IntraContainer(this.child);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        decoration: new BoxDecoration(color: white3),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(
                IntraMargin.horizontalMargin,
                IntraMargin.verticalMargin,
                IntraMargin.horizontalMargin,
                IntraMargin.verticalMargin
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
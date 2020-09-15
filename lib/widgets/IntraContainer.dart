

import 'package:flutter/cupertino.dart';
import 'package:intra/meta/intraSpacing/margin.dart';

class IntraContainer extends StatelessWidget {

  final Widget child;
  
  IntraContainer(this.child);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(
            IntraMargin.horizontalMargin,
            IntraMargin.verticalMargin,
            IntraMargin.horizontalMargin,
            IntraMargin.verticalMargin
        ),
        child: child,
      ),
    );
  }
}
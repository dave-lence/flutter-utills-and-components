// ignore_for_file: deprecated_member_use, depend_on_referenced_packages

import 'package:autovogue_main/utils/constant/color_connstant.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../utils/helpers/helper_fnc.dart';

class CustomOverLayLoading extends StatelessWidget {
  final bool withBackground;
  const CustomOverLayLoading({super.key, this.withBackground = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: CHelperFunctions.screenHeight(context),
      width: CHelperFunctions.screenWidth(context),
      decoration: withBackground
          ? BoxDecoration(color: Colors.black.withOpacity(0.8))
          : BoxDecoration(color: Colors.transparent.withOpacity(0.0)),
      child: Center(
        child: SizedBox(
          width: 35,
          height: 35,
          child: LoadingIndicator(
            indicatorType: Indicator.lineSpinFadeLoader,
            colors: withBackground == true
                ? [Colors.white, Colors.white54, Colors.white70]
                : [CColors.black, CColors.darkGray, CColors.darkerGray],
            strokeWidth: 1.0,
            pathBackgroundColor: CColors.accent,
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../utils/constant/color_connstant.dart';
import '../../utils/constant/size.dart';
import '../../utils/helpers/helper_fnc.dart';

class DarkBtn extends StatelessWidget {
  const DarkBtn({
    super.key,
    required this.onTap,
    required this.btnLabel,
    this.height = 0,
    this.width = 0,
    this.fontSize = 16,
    this.borderRadius = 6,
    this.btnLoading = false,
  });

  final void Function()? onTap;
  final double height;
  final double width;
  final double borderRadius;
  final String btnLabel;
  final double fontSize;
  final bool btnLoading;

  @override
  Widget build(BuildContext context) {
    const List<Color> kDefaultRainbowColors = [
      Colors.white,
      Colors.white54,
      Colors.white70,
    ];

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: CColors.primary.withOpacity(0.5),
        side: const BorderSide(color: CColors.black, width: 0),
        backgroundColor: CColors.black,
        fixedSize: Size(
          width == 0 ? CHelperFunctions.screenWidth(context) : width,
          height == 0 ? CSize.buttonHeight : height,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onTap,
      child: btnLoading
          ? const SizedBox(
              width: 35,
              height: 35,
              child: LoadingIndicator(
                indicatorType: Indicator.lineSpinFadeLoader,
                colors: kDefaultRainbowColors,
                strokeWidth: 1.0,
                pathBackgroundColor: null,
              ),
            )
          : Text(
              btnLabel,
              style: GoogleFonts.fraunces(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: width == 0 ? 16 : fontSize,
                  color: Colors.white,
                ),
              ),
            ),
    );
  }
}

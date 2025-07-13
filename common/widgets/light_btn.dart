import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constant/color_connstant.dart';
import '../../utils/constant/size.dart';
import '../../utils/helpers/helper_fnc.dart';

class LightBtn extends StatelessWidget {
  const LightBtn(
      {super.key,
      required this.onTap,
      required this.btnLabel,
      this.btnLoading = false});

  final void Function()? onTap;
  final String btnLabel;
  final bool btnLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            disabledBackgroundColor: CColors.secondary.withOpacity(0.5),
            side: const BorderSide(color: CColors.secondary, width: 0),
            backgroundColor: CColors.secondary,
            fixedSize:  Size(
                CHelperFunctions.screenWidth(context), CSize.buttonHeight),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(CSize.buttonRadius))),
        onPressed: onTap,
        child: btnLoading
            ? SizedBox(
                width: 35,
                height: 35,
                child: Lottie.asset(
                    // height: 200,
                    // width: 200,
                    animate: true,
                    'assets/images/first_loader.json'),
              )
            : Text(
                btnLabel,
                style: GoogleFonts.figtree(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      color: Colors.white,
                      letterSpacing: .5),
                ),
              ));
  }
}

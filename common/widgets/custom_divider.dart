import 'package:flutter/material.dart';

import '../../utils/constant/color_connstant.dart' show CColors;

class CustomDivider extends StatelessWidget {
  final Color dividerColor;
  const CustomDivider({super.key, this.dividerColor = CColors.gray});

  @override
  Widget build(BuildContext context) {
    return Divider(color: dividerColor, thickness: 0.5);
  }
}

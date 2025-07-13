import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../constant/color_connstant.dart';

class CHelperFunctions {

  static final Map<String, Color> _colorMap = {
    'Red': Colors.red,
    'Pink': Colors.pink,
    'Purple': Colors.purple,
    'DeepPurple': Colors.deepPurple,
    'Indigo': Colors.indigo,
    'Blue': Colors.blue,
    'LightBlue': Colors.lightBlue,
    'Cyan': Colors.cyan,
    'Teal': Colors.teal,
    'Green': Colors.green,
    'LightGreen': Colors.lightGreen,
    'Lime': Colors.lime,
    'Yellow': Colors.yellow,
    'Amber': Colors.amber,
    'Orange': Colors.orange,
    'DeepOrange': Colors.deepOrange,
    'Brown': Colors.brown,
    'Grey': Colors.grey,
    'BlueGrey': Colors.blueGrey,
    'Black': Colors.black,
    'White': Colors.white,
  };

  static Color? getColor(String value) {
    return _colorMap[value.trim()];
  }
// Color? selectedColor = THelperFunctions.getColor('Red'); // returns Colors.red
// Color? unknownColor = THelperFunctions.getColor('Sky');  // returns null

  static void showAlert(
    BuildContext context,
    String title,
    String message,
    String lottieString, {
    bool showBtnOne = false,
    Widget? btnOne,
    Widget? btnTwo,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          contentPadding: const EdgeInsets.all(16),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Animation
                SizedBox(
                  height: 120,
                  child: Lottie.asset(
                    lottieString, // Replace with your actual animation asset
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 16),
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                // Message
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                // Buttons stacked vertically
                Column(
                  children: [
                    if (showBtnOne)
                      SizedBox(width: double.infinity, child: btnOne),
                    const SizedBox(height: 8),
                    SizedBox(width: double.infinity, child: btnTwo),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static String truncateString(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd-MM-yyyy'}) {
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static List<T> removeDuplicated<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int columnSize) {
    final wrappedWidgetsList = <Widget>[];
    for (int i = 0; i < widgets.length; i += columnSize) {
      final columnChildren = widgets.sublist(
          i, i + columnSize > widgets.length ? widgets.length : i + columnSize);
      wrappedWidgetsList.add(Column(
        children: columnChildren,
      ));
    }
    return wrappedWidgetsList;
  }

  static Future<T?> showCustomBottomSheet<T>({
    required BuildContext context,
    required Widget child,
    bool isDismissible = true,
    Color backgroundColor = Colors.transparent,
    Color color = Colors.white,
    bool enableDrag = true,
    bool useSafeArea = true,
    double? height,
  }) {
    final maxHeight = MediaQuery.of(context).size.height * 0.95;
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      useSafeArea: useSafeArea,
      showDragHandle: true,
      isScrollControlled: true,
      elevation: 10,

      backgroundColor: backgroundColor,
      constraints: BoxConstraints(
        maxHeight: maxHeight,
      ),
      builder: (_) {
        return Container(
          width: double.infinity,
          height: (height != null && height < maxHeight) ? height : maxHeight,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: child,
        );
      },
    );
  }

 static Future<T?> showCustomModal<T>({
    required BuildContext context,
    double width = 300,
    double height = 400,
    required Widget child,
  }) {
    return showDialog<T?>(

      animationStyle: const AnimationStyle(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInSine,
      ),
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
insetPadding: EdgeInsets.symmetric(horizontal: 20, ),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            width: width,
            height: height,
            child: child,
          ),
        );
      },
    );
  }

}

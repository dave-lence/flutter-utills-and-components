import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/color_connstant.dart';

enum ToastType { success, error, warning, notice }

class CustomToast {
  static void show(
    BuildContext context, {
    // required String title,
    required String message,
    required ToastType type,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlay = Overlay.of(context);
    final colorScheme = _getColorScheme(type);

    final overlayState = Overlay.of(context);
    final animationController = AnimationController(
      vsync: overlayState,
      duration: const Duration(milliseconds: 280),
    );
    final animation = Tween<Offset>(
      begin: const Offset(0, -1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (context) => Positioned(
        top: 60,
        left: 10,
        right: 10,
        child: Material(
          color: Colors.transparent,
          child: SlideTransition(
            position: animation,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: colorScheme['bg'],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    colorScheme['icon'],
                    color: type == ToastType.notice
                        ? Colors.black87
                        : Colors.white,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 1,
                    height: 40,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          type == ToastType.notice
                              ? 'Notice'
                              : type == ToastType.success
                                  ? 'Success'
                                  : type == ToastType.error
                                      ? 'Error'
                                      : 'Warning',
                          style: GoogleFonts.figtree(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: type == ToastType.notice
                                ? Colors.black87
                                : Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          message,
                          style: GoogleFonts.figtree(
                            fontSize: 14,
                            color: type == ToastType.notice
                                ? Colors.black54
                                : Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(entry);
    animationController.forward();

    Future.delayed(duration, () async {
      await animationController.reverse();
      entry.remove();
      animationController.dispose();
    });
  }

  static Map<String, dynamic> _getColorScheme(ToastType type) {
    switch (type) {
      case ToastType.success:
        return {'bg': CColors.black, 'icon': Icons.check_circle};
      case ToastType.error:
        return {'bg': CColors.error, 'icon': Icons.close};
      case ToastType.warning:
        return {'bg': CColors.secondary, 'icon': Icons.warning_amber_rounded};
      case ToastType.notice:
        return {'bg': const Color(0xFFF7F7F7), 'icon': Icons.info_outline};
    }
  }
}

import 'package:flutter/material.dart';

/// Responsive sizing utility.
/// Only scales large layout dimensions. Small spacing/font sizes
/// are already handled well by Flutter's logical pixel system.
/// Scale factor is clamped to avoid extreme sizing on very small/large screens.
class Responsive {
  static double _scaleFactor = 1.0;

  static void init(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // Base design width: 375 (standard phone)
    // Clamp between 0.85 and 1.3 to prevent extremes
    _scaleFactor = (width / 375).clamp(0.85, 1.3);
  }

  /// Scale large layout dimensions (app bar heights, chart heights, logo sizes).
  /// NOT for small spacing or font sizes — Flutter handles those fine.
  static double scale(double size) => size * _scaleFactor;
}

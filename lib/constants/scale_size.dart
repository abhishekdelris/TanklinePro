// Dart imports:
import 'dart:math';

// Project imports:
import 'package:fuel_feet/constants/constants.dart';

///scaling of text size according to the screen width
class ScaleSize {
  static double textScaleFactor(
      {double maxTextScaleFactor = 2, double maxFixFactor = 0.9}) {
    double val =
        (max(Constants.screen.height, Constants.screen.width) / 1400) *
            maxTextScaleFactor;
    return max(maxFixFactor, min(val, maxTextScaleFactor));
  }
}

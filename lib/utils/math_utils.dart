/// _Example usage:_
/// ```md
/// [   45   ] => [  100%  ]
///
/// [  22.5  ] => [   Y%   ]
/// ```
///
/// ```
/// final y = simpleRuleOfThree(x1: 45, y1: 100, x2: 22.5);
///
/// print(y); // 50 (That is, 50%)
/// ```
double simpleRuleOfThree({double x1, double y1, double x2}) => x2 * y1 / x1;

/// [Implementation of this](https://en.wikipedia.org/wiki/Linear_interpolation)
///
/// Apply a linear interpolation given two range:
/// ```
/// [0, 50]       => Interval A
///
/// [9000, 18000] => Interval B
/// ```
/// ```
/// final getInterpolationValueAt = linearInterpolation([
///   0,
///   50,
/// ], [
///   9000,
///   18000,
/// ]);
///
/// final valueAt25 = getInterpolationValueAt(25);
///
/// print(valueAt25); // 13500
/// ```
///
/// Works fine with negative values
double Function(double xA) linearInterpolation(
  List<double> xInterval,
  List<double> yInterval, {
  bool keepInRange = false,
}) {
  final x0 = xInterval[0];
  final x1 = xInterval[1];

  final y0 = yInterval[0];
  final y1 = yInterval[1];

  double getInterpolationValueAt(double xA) {
    final outOfRange = xA > x1 || xA < x0;

    if (outOfRange) {
      if (keepInRange) {
        xA = xA < x0 ? x0 : x1;
      } else {
        throw ArgumentError(
          '''Value [xA] out of range, valid values: [$x0, $x1]. Current value: $xA''',
        );
      }
    }

    final yA = y0 + (y1 - y0) * (xA - x0) / (x1 - x0);

    return yA;
  }

  return getInterpolationValueAt;
}

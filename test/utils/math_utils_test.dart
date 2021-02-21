import 'package:test/test.dart';
import 'package:app_utils/utils/math_utils.dart';

void main() {
  group('simpleRuleOfThree() method', () {
    test('simple operation', () {
      final cases = [
        [45.0, 100.0, 22.5, 50.0],
        [10.0, 100.0, 5.0, 50.0],
        [15.0, 30.0, 7.5, 15.0],
        [84.0, 50.0, 42.0, 25.0],
      ];

      for (final xy in cases) {
        final x1 = xy[0];
        final x2 = xy[1];
        final y1 = xy[2];
        final y2 = xy[3];

        final y = simpleRuleOfThree(x1: x1, y1: y1, x2: x2);

        expect(y, equals(y2));
      }
    });
  });
  group('linearInterpolation() method', () {
    test('simple operation', () {
      final getInterpolationValueAt = linearInterpolation([
        0,
        50,
      ], [
        9000,
        18000,
      ]);

      final valueAt25 = getInterpolationValueAt(25);

      expect(valueAt25, equals(13500));
    });
    test('negative values', () {
      final getInterpolationValueAt = linearInterpolation([
        -100,
        -50,
      ], [
        9000,
        18000,
      ]);

      final valueAt25 = getInterpolationValueAt(-75);

      expect(valueAt25, equals(13500));
    });
    test('should throw ArgumentError', () {
      final getInterpolationValueAt = linearInterpolation([
        -100,
        -50,
      ], [
        9000,
        18000,
      ]);

      void _getValueAtMinus101() => getInterpolationValueAt(-101);

      expect(_getValueAtMinus101, throwsA(isA<ArgumentError>()));
    });
    test("shouldnt throw ArgumentError", () {
      final getInterpolationValueAt = linearInterpolation([
        -100,
        -50,
      ], [
        9000,
        18000,
      ], keepInRange: true);

      final valueAtMinus101 = getInterpolationValueAt(-101);

      expect(valueAtMinus101, equals(9000));
    });
  });
}

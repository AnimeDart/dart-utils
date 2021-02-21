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
}

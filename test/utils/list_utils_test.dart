import 'package:app_utils/utils.dart';
import 'package:test/test.dart';

void main() {
  group('hasIntersection() method', () {
    test('simple operation', () {
      const a1 = [1, 2, 3, 4];
      const b1 = [9, 7, 4];

      const a2 = [1, 3, 6, 9];
      const b2 = [0, 3, 1];

      const a3 = [0, 0, 0, 0];
      const b3 = [0, 0, 0, 0];

      const a4 = [0, 0, 0, 0];
      const b4 = [1, 1, 1, 1];

      const a5 = [0, 3, 0, 0];
      const b5 = [2, 1, 1, 2];

      const a6 = [3, 5, 2, 6];
      const b6 = [9, 2, 4, 6];

      expect(hasIntersection(a1, b1), true);
      expect(hasIntersection(a2, b2), true);
      expect(hasIntersection(a3, b3), true);
      expect(hasIntersection(a4, b4), false);
      expect(hasIntersection(a5, b5), false);
      expect(hasIntersection(a6, b6), true);
    });
    test('empty context', () {
      const a1 = [1, 2, 3, 4];
      const b1 = [];

      const a2 = [];
      const b2 = [0, 3, 1];

      const a3 = [0];
      const b3 = [];

      const a4 = [];
      const b4 = [];

      expect(hasIntersection(a1, b1), false);
      expect(hasIntersection(a2, b2), false);
      expect(hasIntersection(a3, b3), false);
      expect(hasIntersection(a4, b4), false);
    });
  });
  group('flatList() method', () {
    test('simple operation', () {
      final accuracy = 5000;

      final randomCases = <List<Object>>[];
      final manualCases = [
        [
          6,
          [
            1,
            [
              2,
              [
                3,
                [
                  4,
                  [
                    5,
                    [6]
                  ]
                ]
              ]
            ]
          ]
        ],
        [
          25,
          [
            1,
            2,
            [
              3,
              4,
              5,
              [6, 7],
              [
                8,
                9,
                [
                  10,
                  11,
                  12,
                  [13, 14, 15],
                  [16, 17, 18],
                  [
                    19,
                    20,
                    [21, 22, 23]
                  ]
                ]
              ]
            ],
            [24, 25]
          ],
        ]
      ];

      List<Object> _getLastItem(List<Object> list) =>
          list is List<Object> && list.last is int
              ? list
              : _getLastItem(list.last);

      for (var i = 0; i < accuracy; i++) {
        final length = randomInt(max: 100);

        final list = [];

        for (var j = 1; j <= length; j++) {
          final addList = randomInt(max: 100) > 50;

          List<Object> ref;

          if (list.isEmpty) {
            ref = list;
          } else {
            ref = _getLastItem(list);
          }

          ref.add(addList ? <Object>[j] : j);
        }

        randomCases.add([length, list]);
      }

      final cases = [...manualCases]..addAll(randomCases);

      for (final value in cases) {
        final last = value[0];
        final list = value[1];

        final flat = flatList<int>(list);

        expect(
          flat,
          List<int>.generate(last, (index) => index + 1),
        );
        expect(flat.every((item) => item is! Iterable), isTrue);
      }
    });
  });
}

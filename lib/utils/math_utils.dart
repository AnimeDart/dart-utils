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

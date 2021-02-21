/// Generic function to verify if two [Iterables]
/// has at least one commom item
///
/// **True** if has intersection, otherwise, false
bool hasIntersection<T>(Iterable<T> a, Iterable<T> b) {
  return a.any((a) => b.any((b) => b == a));
}

/// Flatten multi-dimensional array
///
/// Example:
/// ```
/// const list = [1, 2, [3, 4, 5, [6, 7], [8, 9]], [10, 11]];
///
/// print(flatList(list)); // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
/// ```
Iterable<T> flatList<T extends Object>(Iterable list) {
  final internalList = <T>[];

  for (final element in list) {
    if (element is Iterable) {
      internalList.addAll(flatList<T>(element));
    } else {
      internalList.add(element);
    }
  }

  return internalList.cast<T>();
}

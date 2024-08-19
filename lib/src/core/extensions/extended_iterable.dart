import 'package:flutter/widgets.dart';

extension ExtendedIterable on Iterable {
  Iterable<Widget> separator(Widget element) sync* {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      yield iterator.current;
      while (iterator.moveNext()) {
        yield element;
        yield iterator.current;
      }
    }
  }
}

import 'package:flutter_test/flutter_test.dart';

import 'package:oneui_plus/oneui_plus.dart';

void main() {
  test('adds one to input values', () {
    final OneContainedButton containedButton =
        OneContainedButton(child: "Test Button", onPressed: () => {});
    containedButton.child;
  });
}

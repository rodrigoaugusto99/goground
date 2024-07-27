import 'package:flutter_test/flutter_test.dart';
import 'package:goground/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('TestingCustomScrollViewViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}

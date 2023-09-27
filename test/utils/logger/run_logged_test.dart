import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:budget_tracker/utils/utils.dart';

class MockLogger extends Mock implements Logger {}

void main() {
  group('runLogged Tests', () {
    test('runLogged should add logger to zoneValues', () {
      final logger = MockLogger();
      runLogged(
        () => expect(Zone.current[#logger], equals(logger)),
        logger: logger,
      );
    });
  });
}

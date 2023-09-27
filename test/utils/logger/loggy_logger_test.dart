import 'package:flutter_test/flutter_test.dart';
import 'package:loggy/loggy.dart' as loggy;
import 'package:mocktail/mocktail.dart';

import 'package:budget_tracker/utils/utils.dart';

class MockLoggy extends Mock implements loggy.Loggy {}

void main() {
  late LoggyLogger sut;
  late loggy.Loggy mockLoggy;

  setUp(() {
    mockLoggy = MockLoggy();

    sut = LoggyLogger(mockLoggy);
  });

  group('LoggyLogger Tests', () {
    test('LoggyLogger log should map LogLevel.all to loggy.LogLevel', () {
      const map = {
        LogLevel.all: loggy.LogLevel.all,
        LogLevel.debug: loggy.LogLevel.debug,
        LogLevel.warning: loggy.LogLevel.warning,
        LogLevel.info: loggy.LogLevel.info,
        LogLevel.error: loggy.LogLevel.error,
        LogLevel.off: loggy.LogLevel.off,
      };

      void doTest(LogLevel logLevel, loggy.LogLevel loggyLogLevel) {
        const message = 'test message';

        sut.log(logLevel, message);

        verify(() => mockLoggy.log(loggyLogLevel, message)).called(1);
      }

      for (final entry in map.entries) {
        doTest(entry.key, entry.value);
      }
    });

    test('LoggyLogger should pass all arguments to loggy', () {
      const message = 'message';
      final error = Exception('error');
      final stackTrace = StackTrace.current;

      sut.log(LogLevel.error, message, error, stackTrace);

      verify(() => mockLoggy.log(loggy.LogLevel.error, message, error, stackTrace)).called(1);
    });
  });
}

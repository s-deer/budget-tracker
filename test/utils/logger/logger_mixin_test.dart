// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:budget_tracker/utils/utils.dart';

class MockLogger extends Mock implements Logger {}

class TestClass with LoggerMixin {}

void main() {
  late Logger mockLogger;
  late TestClass sut;

  setUp(() {
    mockLogger = MockLogger();
    sut = TestClass();
  });

  test('debugLog should call logger.debug with right arguments', () {
    runLogged(
      () {
        const message = 'Debug message';
        final error = Exception('Test error');
        final stackTrace = StackTrace.current;

        sut.debugLog(message, error, stackTrace);

        verify(() => mockLogger.debug('[TestClass]: $message', error, stackTrace)).called(1);
      },
      logger: mockLogger,
    );
  });

  test('infoLog should call logger.info with right arguments', () {
    runLogged(
      () {
        const message = 'Info message';
        final error = Exception('Test error');
        final stackTrace = StackTrace.current;

        sut.infoLog(message, error, stackTrace);

        verify(() => mockLogger.info('[TestClass]: $message', error, stackTrace)).called(1);
      },
      logger: mockLogger,
    );
  });

  test('warningLog should call logger.warning with right arguments', () {
    runLogged(
      () {
        const message = 'Warning message';
        final error = Exception('Test error');
        final stackTrace = StackTrace.current;

        sut.warningLog(message, error, stackTrace);

        verify(() => mockLogger.warning('[TestClass]: $message', error, stackTrace)).called(1);
      },
      logger: mockLogger,
    );
  });

  test('errorLog should call logger.error with right arguments', () {
    runLogged(
      () {
        const message = 'Error message';
        final error = Exception('Test error');
        final stackTrace = StackTrace.current;

        sut.errorLog(message, error, stackTrace);

        verify(() => mockLogger.error('[TestClass]: $message', error, stackTrace)).called(1);
      },
      logger: mockLogger,
    );
  });

  test('logger should return current logger from zone', () {
    runLogged(
      () => expect(sut.logger, equals(mockLogger)),
      logger: mockLogger,
    );
  });

  test('loggablePrefix should return [ClassName]', () {
    runLogged(
      () => expect(sut.loggablePrefix, equals('TestClass')),
      logger: mockLogger,
    );
  });
}

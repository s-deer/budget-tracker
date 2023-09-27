import 'package:flutter_test/flutter_test.dart';

import 'package:budget_tracker/utils/utils.dart';

class TestLogger extends Logger {
  LogLevel? lastLoggedLevel;
  dynamic lastLoggedMessage;
  Object? lastLoggedError;
  StackTrace? lastLoggedStackTrace;

  @override
  void log(LogLevel level, dynamic message, [Object? error, StackTrace? stackTrace]) {
    lastLoggedLevel = level;
    lastLoggedMessage = message;
    lastLoggedError = error;
    lastLoggedStackTrace = stackTrace;
  }
}

void main() {
  late TestLogger sut;

  setUp(() {
    sut = TestLogger();
  });

  group('Logger Tests', () {
    test('Logger error() should log an error message', () {
      const errorMessage = 'This is an error message';
      final error = Exception('error');
      final stackTrace = StackTrace.current;

      sut.error(errorMessage, error, stackTrace);

      expect(sut.lastLoggedLevel, equals(LogLevel.error));
      expect(sut.lastLoggedMessage, equals(errorMessage));
      expect(sut.lastLoggedError, equals(error));
      expect(sut.lastLoggedStackTrace, equals(stackTrace));
    });

    test('Logger debug() should log a debug message', () {
      const debugMessage = 'This is a debug message';
      final error = Exception('debug');
      final stackTrace = StackTrace.current;

      sut.debug(debugMessage, error, stackTrace);

      expect(sut.lastLoggedLevel, equals(LogLevel.debug));
      expect(sut.lastLoggedMessage, equals(debugMessage));
      expect(sut.lastLoggedError, equals(error));
      expect(sut.lastLoggedStackTrace, equals(stackTrace));
    });

    test('Logger info() should log an info message', () {
      const infoMessage = 'This is an info message';
      final error = Exception('info');
      final stackTrace = StackTrace.current;

      sut.info(infoMessage, error, stackTrace);

      expect(sut.lastLoggedLevel, equals(LogLevel.info));
      expect(sut.lastLoggedMessage, equals(infoMessage));
      expect(sut.lastLoggedError, equals(error));
      expect(sut.lastLoggedStackTrace, equals(stackTrace));
    });

    test('Logger warning() should log a warning message', () {
      const warningMessage = 'This is a warning message';
      final error = Exception('warning');
      final stackTrace = StackTrace.current;

      sut.warning(warningMessage, error, stackTrace);

      expect(sut.lastLoggedLevel, equals(LogLevel.warning));
      expect(sut.lastLoggedMessage, equals(warningMessage));
      expect(sut.lastLoggedError, equals(error));
      expect(sut.lastLoggedStackTrace, equals(stackTrace));
    });

    test('Logger log() should log a message with the specified log level', () {
      const customMessage = 'This is a custom message';
      const customLogLevel = LogLevel.all;
      final error = Exception('log');
      final stackTrace = StackTrace.current;

      sut.log(customLogLevel, customMessage, error, stackTrace);

      expect(sut.lastLoggedLevel, equals(customLogLevel));
      expect(sut.lastLoggedMessage, equals(customMessage));
      expect(sut.lastLoggedError, equals(error));
      expect(sut.lastLoggedStackTrace, equals(stackTrace));
    });

    test('Logger current should return current logger from Zone', () {
      runLogged(
        () {
          expect(Logger.current, equals(sut));
        },
        logger: sut,
      );
    });
  });
}

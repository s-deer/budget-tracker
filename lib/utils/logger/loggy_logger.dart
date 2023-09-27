import 'package:loggy/loggy.dart' as loggy;

import 'logger.dart';

class LoggyLogger extends Logger {
  final loggy.Loggy loggyLogger;

  const LoggyLogger(this.loggyLogger);

  @override
  void log(LogLevel level, message, [Object? error, StackTrace? stackTrace]) {
    return loggyLogger.log(
      level.toLoggyLogLevel(),
      message,
      error,
      stackTrace,
    );
  }
}

extension on LogLevel {
  loggy.LogLevel toLoggyLogLevel() {
    if (this == LogLevel.debug) {
      return loggy.LogLevel.debug;
    }

    if (this == LogLevel.info) {
      return loggy.LogLevel.info;
    }

    if (this == LogLevel.warning) {
      return loggy.LogLevel.warning;
    }

    if (this == LogLevel.error) {
      return loggy.LogLevel.error;
    }

    if (this == LogLevel.off) {
      return loggy.LogLevel.off;
    }

    if (this == LogLevel.all) {
      return loggy.LogLevel.all;
    }

    throw Exception('Unsupported LogLevel');
  }
}

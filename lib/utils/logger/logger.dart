import 'dart:async';

export 'logger_mixin.dart';
export 'loggy_logger.dart';
export 'my_loggy_printer.dart';
export 'run_logged.dart';

abstract class Logger {
  const Logger();

  void log(LogLevel level, dynamic message, [Object? error, StackTrace? stackTrace]);

  void error(dynamic message, [Object? error, StackTrace? stackTrace]) {
    return log(LogLevel.error, message, error, stackTrace);
  }

  void debug(dynamic message, [Object? error, StackTrace? stackTrace]) {
    return log(LogLevel.debug, message, error, stackTrace);
  }

  void info(dynamic message, [Object? error, StackTrace? stackTrace]) {
    return log(LogLevel.info, message, error, stackTrace);
  }

  void warning(dynamic message, [Object? error, StackTrace? stackTrace]) {
    return log(LogLevel.warning, message, error, stackTrace);
  }

  static Logger get current {
    return Zone.current[#logger];
  }
}

enum LogLevel {
  all,
  debug,
  info,
  warning,
  error,
  off,
}

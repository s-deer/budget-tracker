import 'dart:developer' as developer;

import 'package:loggy/loggy.dart';

class MyLoggyPrinter extends LoggyPrinter {
  const MyLoggyPrinter();

  static final Map<LogLevel, String> _levelPrefixes = <LogLevel, String>{
    LogLevel.debug: '[D]',
    LogLevel.info: '[I]',
    LogLevel.warning: '[W]',
    LogLevel.error: '[E]',
  };

  // For undefined log levels
  static const String _defaultPrefix = '[U]';

  @override
  void onLog(LogRecord record) {
    final String time = record.time.toIso8601String().split('T')[1];
    final String callerFrame = record.callerFrame == null ? '-' : '(${record.callerFrame?.location})';

    final String prefix = levelPrefix(record.level) ?? _defaultPrefix;

    developer.log(
      '$prefix $time $callerFrame ${record.message}',
      name: record.loggerName,
      error: record.error,
      stackTrace: record.stackTrace,
      level: record.level.priority,
      time: record.time,
      zone: record.zone,
      sequenceNumber: record.sequenceNumber,
    );
  }

  /// Get prefix for level
  String? levelPrefix(LogLevel level) {
    return _levelPrefixes[level];
  }
}

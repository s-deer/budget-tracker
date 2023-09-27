import 'package:flutter/widgets.dart';

import 'logger.dart';

mixin LoggerMixin {
  @protected
  String get loggablePrefix => runtimeType.toString();

  @protected
  Logger get logger => Logger.current;

  String _addPrefix(dynamic message) {
    return '[$loggablePrefix]: $message';
  }

  @protected
  void debugLog(dynamic message, [Object? error, StackTrace? stackTrace]) {
    return logger.debug(_addPrefix(message), error, stackTrace);
  }

  @protected
  void infoLog(dynamic message, [Object? error, StackTrace? stackTrace]) {
    return logger.info(_addPrefix(message), error, stackTrace);
  }

  @protected
  void warningLog(dynamic message, [Object? error, StackTrace? stackTrace]) {
    return logger.warning(_addPrefix(message), error, stackTrace);
  }

  @protected
  void errorLog(dynamic message, [Object? error, StackTrace? stackTrace]) {
    return logger.error(_addPrefix(message), error, stackTrace);
  }
}

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:loggy/loggy.dart' as loggy;

import 'logger.dart';

@module
abstract class LoggerModule {
  Logger get logger {
    return LoggyLogger(loggy.Loggy(''));
  }

  loggy.LogOptions get logOptions {
    return const loggy.LogOptions(kReleaseMode ? loggy.LogLevel.error : loggy.LogLevel.all);
  }
}

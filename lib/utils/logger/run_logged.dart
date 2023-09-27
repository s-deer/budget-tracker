import 'dart:async';

import 'logger.dart';

T runLogged<T>(T Function() cb, {required Logger logger}) {
  return runZoned(
    cb,
    zoneValues: {
      #logger: logger,
    },
  );
}

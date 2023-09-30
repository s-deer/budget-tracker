import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:loggy/loggy.dart';

import 'injection/injection.dart';
import 'presentation/I18n/i18n.dart';
import 'utils/utils.dart';

Future<void> bootstrap(Widget Function() callback) async {
  configureDependencies();

  return runLogged(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      LocaleSettings.useDeviceLocale();

      Loggy.initLoggy(
        logPrinter: const MyLoggyPrinter(),
        logOptions: sl(),
      );


      runApp(callback());
    },
    logger: sl(),
  );
}

import 'package:flutter/widgets.dart';

import 'injection/injection.dart';
import 'presentation/I18n/i18n.dart';

Future<void> bootstrap(Widget Function() callback) async {
  WidgetsFlutterBinding.ensureInitialized();

  LocaleSettings.useDeviceLocale();

  configureDependencies();

  runApp(TranslationProvider(child: callback()));
}

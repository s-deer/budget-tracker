import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'I18n/i18n.dart';
import 'routes/routes.dart';
import '../injection/injection.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      routerConfig: sl<AppRouter>().config(),
    );
  }
}

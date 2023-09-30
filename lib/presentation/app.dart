import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'I18n/i18n.dart';
import 'routes/routes.dart';
import '../injection/injection.dart';
import 'theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.formColor();
    final router = sl<AppRouter>();

    return TranslationProvider(
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            theme: theme.light,
            darkTheme: theme.dark,
            themeMode: ThemeMode.system,
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            routerConfig: router.config(),
          );
        },
      ),
    );
  }
}

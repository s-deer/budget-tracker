import 'package:flutter/material.dart';

import 'routes/routes.dart';
import '../injection/injection.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: sl<AppRouter>().config(),
    );
  }
}

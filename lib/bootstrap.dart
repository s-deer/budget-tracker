import 'package:flutter/widgets.dart';

import 'injection/injection.dart';

Future<void> bootstrap(Widget Function() callback) async {
  WidgetsFlutterBinding.ensureInitialized();
  
  configureDependencies();

  runApp(callback());
}

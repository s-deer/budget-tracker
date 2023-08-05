import 'package:injectable/injectable.dart';

import 'database.dart';

@module
abstract class DatabaseModule {
  @singleton
  MyDatabase get database => MyDatabase();
}

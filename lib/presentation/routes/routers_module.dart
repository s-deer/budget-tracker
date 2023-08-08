import 'package:budget_tracker/presentation/routes/app_router.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RoutesModule {
  @singleton
  AppRouter get router => AppRouter();
}

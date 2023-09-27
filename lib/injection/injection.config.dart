// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:budget_tracker/database/database.dart' as _i6;
import 'package:budget_tracker/database/database_module.dart' as _i7;
import 'package:budget_tracker/presentation/routes/app_router.dart' as _i3;
import 'package:budget_tracker/presentation/routes/routers_module.dart' as _i9;
import 'package:budget_tracker/utils/logger/logger.dart' as _i5;
import 'package:budget_tracker/utils/logger/logger_module.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:loggy/loggy.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final routesModule = _$RoutesModule();
    final loggerModule = _$LoggerModule();
    final databaseModule = _$DatabaseModule();
    gh.singleton<_i3.AppRouter>(routesModule.router);
    gh.factory<_i4.LogOptions>(() => loggerModule.logOptions);
    gh.factory<_i5.Logger>(() => loggerModule.logger);
    gh.singleton<_i6.MyDatabase>(databaseModule.database);
    return this;
  }
}

class _$DatabaseModule extends _i7.DatabaseModule {}

class _$LoggerModule extends _i8.LoggerModule {}

class _$RoutesModule extends _i9.RoutesModule {}

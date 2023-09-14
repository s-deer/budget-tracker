import 'package:budget_tracker/core/core.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<P, R> {
  FutureEither<R> execute(P param);

  FutureEither<R> call(P param) {
    return _handleExceptions(() => execute(param));
  }

  FutureEither<R> _handleExceptions(FutureEither<R> Function() cb) async {
    try {
      return await cb();
    } catch (e) {
      return Left(UndefinedFailure(e));
    }
  }
}

abstract class NoParamsUseCase<R> extends UseCase<NoParams?, R> {
  @override
  FutureEither<R> execute([NoParams? param]);

  @override
  FutureEither<R> call([NoParams? param]) async {
    return _handleExceptions(() => execute(param));
  }
}

abstract class NoParams {}

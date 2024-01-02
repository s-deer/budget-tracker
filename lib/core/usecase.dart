import 'package:fpdart/fpdart.dart';

import 'core.dart';

abstract class UseCase<P, R> {
  R execute(P param);
  R call(P param);
}

abstract class AsyncUseCase<P, R> extends UseCase<P, FutureEither<R>> {
  @override
  FutureEither<R> call(P param) async {
    try {
      return await execute(param);
    } catch (e) {
      return Left(UndefinedFailure(e));
    }
  }
}

abstract class NoParamsAsyncUseCase<R> extends AsyncUseCase<NoParams?, R> {
  @override
  FutureEither<R> call([NoParams? param]) => super.call(param);
}

abstract class StreamUseCase<P, R> extends UseCase<P, Either<Failure, Stream<R>>> {
  @override
  Either<Failure, Stream<R>> call(P param) {
    try {
      return execute(param);
    } catch (e) {
      return Left(UndefinedFailure(e));
    }
  }
}

abstract class NoParamsStreamUseCase<R> extends StreamUseCase<NoParams?, R> {
  @override
  Either<Failure, Stream<R>> call([NoParams? param]) => super.call(param);
}

abstract class NoParams {}

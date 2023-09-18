abstract class Failure {
  final Object? message;

  const Failure([this.message]);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message]);
}

class InternalAppFailure extends Failure {
  const InternalAppFailure([super.message]);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message]);
}

class UndefinedFailure extends Failure {
  const UndefinedFailure(super.message);
}

import 'dart:async';

import 'package:dartz/dartz.dart';

extension FutureEitherExtension<L, R> on Future<Either<L, R>> {
  Future<Either<L, T>> eitherThen<T>(Future<Either<L, T>> Function(R r) right) async {
    return then((value) => value.fold(left, right));
  }

  Future<Either<L, T>> map<T>(FutureOr<T> Function(R r) f) async {
    return then((value) => value.fold(left, (r) async => right(await f(r))));
  }

  Future<T> fold<T>(FutureOr<T> Function(L) ifLeft, FutureOr<T> Function(R) ifRight) {
    return then((value) => value.fold(ifLeft, ifRight));
  }
}

extension EitherResultExtension<L, R> on Either<L, R> {
  R get right {
    if (this is Right<L, R>) {
      return (this as Right<L, R>).value;
    }

    throw Exception('Call right getter on Left either');
  }

  L get left {
    if (this is Left<L, R>) {
      return (this as Left<L, R>).value;
    }

    throw Exception('Call left getter on Right either');
  }
}

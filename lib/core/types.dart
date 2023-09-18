import 'package:dartz/dartz.dart';

import 'core.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;

import 'package:dartz/dartz.dart';
import 'package:tally_task/core/error/failure.dart';

typedef FailureOr<T> = Either<Failure, T>;
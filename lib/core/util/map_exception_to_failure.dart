import 'package:tally_task/core/error/exceptions.dart';
import 'package:tally_task/core/error/failure.dart';

Failure mapExceptionToFailure(Object param) {
  return switch (param) {
    CacheException _ => CacheFailure(details: param.toString()),
    NetworkException _ => NetworkFailure(details: param.toString()),
    _ => ServerFailure(details: param.toString()),
  };
}

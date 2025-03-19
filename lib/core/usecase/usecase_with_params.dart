import 'package:dartz/dartz.dart';
import 'package:merchant_app/core/error/failure.dart';

abstract class UseCaseWithParams<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

import 'package:dartz/dartz.dart';
import 'package:merchant_app/core/error/failure.dart';

abstract class UseCaseWithoutParams<Type> {
  Future<Either<Failure, Type>> call();
}

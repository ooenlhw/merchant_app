import 'package:merchant_app/core/error/failure.dart';
import 'package:merchant_app/core/usecase/usecase_with_params.dart';
import 'package:merchant_app/features/search/domain/repositories/business_search_repository.dart';
import 'package:dartz/dartz.dart';

class SaveRecentSearch implements UseCaseWithParams<void, String> {
  final BusinessSearchRepository repository;

  SaveRecentSearch(this.repository);

  @override
  Future<Either<Failure, void>> call(String query) async {
    try {
      await repository.saveRecentSearch(query);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure('An error occurred', message: ''));
    }
  }
}

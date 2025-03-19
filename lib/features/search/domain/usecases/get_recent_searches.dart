import 'package:dartz/dartz.dart';
import 'package:merchant_app/core/error/failure.dart';
import 'package:merchant_app/features/search/domain/repositories/business_search_repository.dart';
import '../../../../core/usecase/usecase_without_params.dart';

class GetRecentSearches implements UseCaseWithoutParams<List<String>> {
  final BusinessSearchRepository repository;

  GetRecentSearches(this.repository);

  @override
  Future<Either<Failure, List<String>>> call() {
    return repository.getRecentSearches();
  }
}

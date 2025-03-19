import 'package:dartz/dartz.dart';
import 'package:merchant_app/core/error/failure.dart';
import 'package:merchant_app/core/usecase/usecase_with_params.dart';
import 'package:merchant_app/features/search/domain/entities/business.dart';
import 'package:merchant_app/features/search/domain/repositories/business_search_repository.dart';

class SearchBusinesses implements UseCaseWithParams<List<Business>, String> {
  final BusinessSearchRepository repository;

  SearchBusinesses(this.repository);

  @override
  Future<Either<Failure, List<Business>>> call(String query) {
    return repository.searchBusinesses(query);
  }
}

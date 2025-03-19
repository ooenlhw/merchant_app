import 'package:dartz/dartz.dart';
import 'package:merchant_app/core/error/failure.dart';
import '../entities/business.dart';

abstract class BusinessSearchRepository {
  Future<Either<Failure, List<Business>>> searchBusinesses(String query);
  Future<void> saveRecentSearch(String query);
  Future<Either<Failure, List<String>>> getRecentSearches();
}

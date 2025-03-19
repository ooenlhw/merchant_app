import 'package:dartz/dartz.dart';
import 'package:merchant_app/core/error/exceptions.dart';
import 'package:merchant_app/core/error/failure.dart';
import 'package:merchant_app/features/search/data/datasources/business_search_remote_data_source.dart';
import 'package:merchant_app/features/search/data/datasources/recent_search_local_data_source.dart';
import 'package:merchant_app/features/search/domain/entities/business.dart';
import 'package:merchant_app/features/search/domain/repositories/business_search_repository.dart';

class BusinessSearchRepositoryImpl implements BusinessSearchRepository {
  final BusinessSearchRemoteDataSource remoteDataSource;
  final RecentSearchLocalDataSource localDataSource;

  BusinessSearchRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, List<Business>>> searchBusinesses(String query) async {
    try {
      final businesses = await remoteDataSource.searchBusinesses(query);
      return Right(businesses);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, message: ''));
    } catch (_) {
      return Left(ServerFailure("Unexpected error occurred", message: ''));
    }
  }

  @override
  Future<void> saveRecentSearch(String query) async {
    await localDataSource.saveRecentSearch(query);
  }

  @override
  Future<Either<Failure, List<String>>> getRecentSearches() async {
    try {
      final searches = await localDataSource.getRecentSearches();
      return Right(searches);
    } catch (_) {
      return Left(CacheFailure("Failed to retrieve recent searches", message: ''));
    }
  }
}

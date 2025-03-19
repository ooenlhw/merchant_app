// service_locator.dart
import 'package:get_it/get_it.dart';
import 'package:merchant_app/features/search/data/datasources/business_search_remote_data_source.dart';
import 'package:merchant_app/features/search/data/datasources/recent_search_local_data_source.dart';
import 'package:merchant_app/features/search/data/repositories/business_search_repository_impl.dart';
import 'package:merchant_app/features/search/domain/repositories/business_search_repository.dart';
import 'package:merchant_app/features/search/domain/usecases/get_recent_searches.dart';
import 'package:merchant_app/features/search/domain/usecases/search_businesses.dart';
import 'package:merchant_app/features/search/presentation/bloc/search_bloc.dart';
import 'package:merchant_app/features/shop/data/repositories/merchant_repository_impl.dart';
import 'package:http/http.dart' as http;
import 'package:merchant_app/features/shop/data/repositories/product_repository_impl.dart';
import 'package:merchant_app/features/shop/domain/usecases/get_merchant.dart';
import 'package:merchant_app/features/shop/domain/usecases/get_product.dart';
import 'package:merchant_app/features/shop/presentation/bloc/merchant_bloc.dart';
import 'package:merchant_app/features/shop/presentation/bloc/product_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  // Initialize SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Data Sources
  sl.registerLazySingleton<BusinessSearchRemoteDataSource>(
      () => BusinessSearchRemoteDataSource());
  sl.registerLazySingleton<RecentSearchLocalDataSource>(
      () => RecentSearchLocalDataSource(sl()));

  // Repository
  sl.registerLazySingleton(() => MerchantApiRepository(
      'https://dummyjson.com/auth/login',
      client: http.Client()));
  sl.registerLazySingleton(
      () => ProductApiRepository('https://fakestoreapi.com/products'));
  sl.registerLazySingleton<BusinessSearchRepository>(
      () => BusinessSearchRepositoryImpl(sl(), sl()));

  // Use Cases
  sl.registerLazySingleton(() => LoginMerchant(sl<MerchantApiRepository>()));
  sl.registerLazySingleton(() => GetProducts(sl<ProductApiRepository>()));
  sl.registerLazySingleton(() => SearchBusinesses(sl()));
  sl.registerLazySingleton(() => GetRecentSearches(sl()));

  // Cubits
  sl.registerFactory(() => LoginCubit(sl<LoginMerchant>()));
  sl.registerFactory(() => ProductCubit(sl<GetProducts>()));

  // Fix: Correct registration of SearchBloc
  sl.registerFactory(() => SearchBloc(sl(), sl()));
}

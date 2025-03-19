// search_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:merchant_app/core/error/failure.dart';
import 'package:merchant_app/features/search/domain/entities/business.dart';
import 'package:merchant_app/features/search/domain/usecases/get_recent_searches.dart';
import 'package:merchant_app/features/search/domain/usecases/search_businesses.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchBusinesses searchBusinesses;
  final GetRecentSearches getRecentSearches;

  // Fix: Remove the unnecessary parameter
  SearchBloc(this.searchBusinesses, this.getRecentSearches)
      : super(SearchInitial()) {
    on<PerformSearch>(_onPerformSearch);
    on<LoadRecentSearches>(_onLoadRecentSearches);
  }

  void _onPerformSearch(PerformSearch event, Emitter<SearchState> emit) async {
    emit(SearchLoading());

    final result = await searchBusinesses(event.query);
    print('search_bloc result $result');
    result.fold(
      (failure) => emit(SearchError(_mapFailureToMessage(failure))),
      (businesses) => emit(SearchLoaded(businesses)),
    );
  }

  void _onLoadRecentSearches(
      LoadRecentSearches event, Emitter<SearchState> emit) async {
    final result = await getRecentSearches();
    result.fold(
      (failure) => emit(SearchError(_mapFailureToMessage(failure))),
      (searches) => emit(RecentSearchesLoaded(searches)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure is ServerFailure ? failure.message : "Unexpected Error";
  }
}

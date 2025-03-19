part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Business> businesses;
  const SearchLoaded(this.businesses);

  @override
  List<Object> get props => [businesses];
}

class RecentSearchesLoaded extends SearchState {
  final List<String> searches;
  const RecentSearchesLoaded(this.searches);

  @override
  List<Object> get props => [searches];
}

class SearchError extends SearchState {
  final String message;
  const SearchError(this.message);

  @override
  List<Object> get props => [message];
}

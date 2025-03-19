import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/search_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SearchBloc>().add(LoadRecentSearches());
  }

  void _onSearch() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      context.read<SearchBloc>().add(PerformSearch(query));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Businesses")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search...",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _onSearch,
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  print('SEARCH STATE LOADING');
                  return Center(child: CircularProgressIndicator());
                } else if (state is SearchLoaded) {
                  print('SEARCH STATE LOADED');
                  return ListView.builder(
                    itemCount: state.businesses.length,
                    itemBuilder: (context, index) {
                      final business = state.businesses[index];
                      print('business info $business');
                      return ListTile(
                        title: Text(business.title),
                        subtitle: Text(business.description),
                        onTap: () {
                          // Navigate to business details page
                        },
                      );
                    },
                  );
                } else if (state is RecentSearchesLoaded) {
                  print('RECENT SEARCHES LOADED');
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Recent Searches",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      ...state.searches.map((search) => ListTile(
                            title: Text(search),
                            onTap: () {
                              _searchController.text = search;
                              _onSearch();
                            },
                          )),
                    ],
                  );
                } else if (state is SearchError) {
                  print('SEARCH STATE ERROR');
                  print(state.message);
                  return Center(
                      child: Text(state.message,
                          style: TextStyle(color: Colors.red)));
                }
                return Center(child: Text("Search for businesses"));
              },
            ),
          ),
        ],
      ),
    );
  }
}

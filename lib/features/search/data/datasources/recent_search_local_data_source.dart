import 'package:shared_preferences/shared_preferences.dart';

class RecentSearchLocalDataSource {
  final SharedPreferences prefs;

  RecentSearchLocalDataSource(this.prefs);

  Future<void> saveRecentSearch(String query) async {
    List<String> searches = prefs.getStringList('recent_searches') ?? [];
    searches.insert(0, query);
    if (searches.length > 10) searches.removeLast();
    await prefs.setStringList('recent_searches', searches);
  }

  Future<List<String>> getRecentSearches() async {
    return prefs.getStringList('recent_searches') ?? [];
  }
}
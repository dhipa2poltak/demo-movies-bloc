
class AppConstants {

  AppConstants._();

  static const String DEV_APP_NAME = 'Demo Movies Dev';
  static const String PROD_APP_NAME = 'Demo Movies';

  static const int DELAY_SPLASH = 3;

  static const int TOP_RATED_MOVIES_INDEX = 0;
  static const int UPCOMING_MOVIES_INDEX = 1;
  static const int NOW_PLAYING_MOVIES_INDEX = 2;
  static const int POPULAR_MOVIES_INDEX = 3;
  static const int SEARCH_MOVIES_INDEX = 4;
  static const int WATCHLIST_MOVIES_INDEX = 5;

  static List<String> TITLE_LIST = [
    "Top Rated Movies",
    "Upcoming Movies",
    "Now Playing Movies",
    "Popular Movies",
    "Search Movies",
    "Watchlist Movies"
  ];
}

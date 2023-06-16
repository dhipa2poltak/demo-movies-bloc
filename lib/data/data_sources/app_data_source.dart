
import 'package:demo_movies/data/models/responses/movie_response.dart';

import '../models/responses/movie_details_response.dart';
import '../models/responses/watchlist_movies_response.dart';

abstract class AppDataSource {
  Future<MovieResponse> getNowPlayingMovies(int page);
  Future<MovieResponse> getTopRatedMovies(int page);
  Future<MovieResponse> getUpcomingMovies(int page);
  Future<MovieResponse> getPopularMovies(int page);
  Future<MovieResponse> searchMovies(String query, int page);
  Future<MovieDetailsResponse> getMovieDetail(int movieId);
  Future<MovieResponse> getWatchlistMovies(int page);
  Future<WatchlistMoviesResponse> isInWatchlistMovies(int movieId);
  Future<void> addToWatchlistMovies(int movieId);
  Future<void> removeFromWatchlistMovies(int movieId);
}

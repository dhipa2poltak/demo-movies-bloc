
import 'package:demo_movies/data/models/add_remove_watchlist_movie.dart';
import 'package:demo_movies/data/models/responses/movie_response.dart';
import 'package:demo_movies/data/models/responses/watchlist_movies_response.dart';
import 'package:injectable/injectable.dart';

import '../../../data/data_sources/app_data_source.dart';
import '../../../data/models/responses/movie_details_response.dart';
import '../core/api_client.dart';

@lazySingleton
class AppDataSourceImpl extends AppDataSource {
  AppDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<MovieResponse> getNowPlayingMovies(int page) {
    return apiClient.getNowPlayingMovies(page: page);
  }

  @override
  Future<MovieResponse> getTopRatedMovies(int page) {
    return apiClient.getTopRatedMovies(page: page);
  }

  @override
  Future<MovieResponse> getUpcomingMovies(int page) {
    return apiClient.getUpcomingMovies(page: page);
  }

  @override
  Future<MovieResponse> getPopularMovies(int page) {
    return apiClient.getPopularMovies(page: page);
  }

  @override
  Future<MovieResponse> searchMovies(String query, int page) {
    return apiClient.searchMovies(query: query, page: page);
  }

  @override
  Future<MovieDetailsResponse> getMovieDetail(int movieId) {
    return apiClient.getMovieDetail(movieId);
  }

  @override
  Future<MovieResponse> getWatchlistMovies(int page) {
    return apiClient.getWatchlistMovies(page: page);
  }

  @override
  Future<WatchlistMoviesResponse> isInWatchlistMovies(int movieId) {
    return apiClient.isInWatchlistMovies(movieId);
  }

  @override
  Future<void> addToWatchlistMovies(int movieId) {
    return apiClient.addRemoveWatchlistMovie(body: AddRemoveWatchlistMovie(movieId: movieId, movieWatchlist: true));
  }

  @override
  Future<void> removeFromWatchlistMovies(int movieId) {
    return apiClient.addRemoveWatchlistMovie(body: AddRemoveWatchlistMovie(movieId: movieId, movieWatchlist: false));
  }
}

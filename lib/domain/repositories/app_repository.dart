
import 'package:dartz/dartz.dart';
import 'package:demo_movies/domain/entities/movie_domain.dart';
import 'package:demo_movies/domain/entities/watchlist_movies_domain.dart';

import '../entities/app_error.dart';
import '../entities/movie_details_domain.dart';

abstract class AppRepository {
  Future<Either<AppError, MovieDomain>> getNowPlayingMovies(int page);
  Future<Either<AppError, MovieDomain>> getTopRatedMovies(int page);
  Future<Either<AppError, MovieDomain>> getUpcomingMovies(int page);
  Future<Either<AppError, MovieDomain>> getPopularMovies(int page);
  Future<Either<AppError, MovieDomain>> searchMovies(String query, int page);
  Future<Either<AppError, MovieDetailsDomain>> getMovieDetail(int movieId);
  Future<Either<AppError, MovieDomain>> getWatchlistMovies(int page);
  Future<Either<AppError, WatchlistMoviesDomain>> isInWatchlistMovies(int movieId);
  Future<Either<AppError, void>> addToWatchlistMovies(int movieId);
  Future<Either<AppError, void>> removeFromWatchlistMovies(int movieId);
}

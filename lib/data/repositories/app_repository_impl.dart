
import 'package:dartz/dartz.dart';
import 'package:demo_movies/domain/entities/movie_domain.dart';
import 'package:demo_movies/domain/entities/watchlist_movies_domain.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/app_error.dart';
import '../../domain/entities/movie_details_domain.dart';
import '../../domain/repositories/app_repository.dart';
import '../data_sources/app_data_source.dart';

@lazySingleton
class AppRepositoryImpl extends AppRepository {
  AppRepositoryImpl({required this.appDataSource});

  AppDataSource appDataSource;

  @override
  Future<Either<AppError, MovieDomain>> getNowPlayingMovies(int page) async {
    try {
      final response = await appDataSource.getNowPlayingMovies(page);

      return Right(response.toDomain());
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, MovieDomain>> getTopRatedMovies(int page) async {
    try {
      final response = await appDataSource.getTopRatedMovies(page);

      return Right(response.toDomain());
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, MovieDomain>> getUpcomingMovies(int page) async {
    try {
      final response = await appDataSource.getUpcomingMovies(page);

      return Right(response.toDomain());
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, MovieDomain>> getPopularMovies(int page) async {
    try {
      final response = await appDataSource.getPopularMovies(page);

      return Right(response.toDomain());
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, MovieDomain>> searchMovies(String query, int page) async {
    try {
      final response = await appDataSource.searchMovies(query, page);

      return Right(response.toDomain());
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, MovieDetailsDomain>> getMovieDetail(int movieId) async {
    try {
      final detailsDomain = await appDataSource.getMovieDetail(movieId).then((value) => value.toDomain());

      return Right(detailsDomain);
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, MovieDomain>> getWatchlistMovies(int page) async {
    try {
      final response = await appDataSource.getWatchlistMovies(page);

      return Right(response.toDomain());
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, WatchlistMoviesDomain>> isInWatchlistMovies(int movieId) async {
    try {
      final response = await appDataSource.isInWatchlistMovies(movieId);

      return Right(response.toDomain());
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, void>> addToWatchlistMovies(int movieId) async {
    try {
      await appDataSource.addToWatchlistMovies(movieId);

      return const Right(null);
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, void>> removeFromWatchlistMovies(int movieId) async {
    try {
      await appDataSource.removeFromWatchlistMovies(movieId);

      return const Right(null);
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }
}

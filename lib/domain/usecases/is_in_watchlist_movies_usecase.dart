
import 'package:dartz/dartz.dart';
import 'package:demo_movies/domain/entities/watchlist_movies_domain.dart';

import '../entities/app_error.dart';

abstract class IsInWatchlistMoviesUseCase {

  Future<Either<AppError, WatchlistMoviesDomain>> call(int movieId);
}

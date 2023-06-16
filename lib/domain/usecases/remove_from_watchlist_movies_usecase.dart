

import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';

abstract class RemoveFromWatchlistMoviesUseCase {

  Future<Either<AppError, void>> call(int movieId);
}

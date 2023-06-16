
import 'package:dartz/dartz.dart';
import 'package:demo_movies/domain/entities/movie_domain.dart';

import '../entities/app_error.dart';

abstract class GetUpcomingMoviesUseCase {

  Future<Either<AppError, MovieDomain>> call(int page);
}

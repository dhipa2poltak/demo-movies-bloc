

import 'package:dartz/dartz.dart';
import 'package:demo_movies/domain/entities/watchlist_movies_domain.dart';
import 'package:injectable/injectable.dart';

import '../entities/app_error.dart';
import '../repositories/app_repository.dart';
import 'is_in_watchlist_movies_usecase.dart';

@Injectable()
class IsInWatchlistMoviesUseCaseImpl extends IsInWatchlistMoviesUseCase {

  IsInWatchlistMoviesUseCaseImpl(this.appRepository);

  final AppRepository appRepository;

  @override
  Future<Either<AppError, WatchlistMoviesDomain>> call(int movieId) async {
    return appRepository.isInWatchlistMovies(movieId);
  }
}

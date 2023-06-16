
import 'package:dartz/dartz.dart';
import 'package:demo_movies/domain/usecases/remove_from_watchlist_movies_usecase.dart';
import 'package:injectable/injectable.dart';

import '../entities/app_error.dart';
import '../repositories/app_repository.dart';

@Injectable()
class RemoveFromWatchlistMoviesUseCaseImpl extends RemoveFromWatchlistMoviesUseCase {

  RemoveFromWatchlistMoviesUseCaseImpl(this.appRepository);

  final AppRepository appRepository;

  @override
  Future<Either<AppError, void>> call(int movieId) async {
    return appRepository.removeFromWatchlistMovies(movieId);
  }
}

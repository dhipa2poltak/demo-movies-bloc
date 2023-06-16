
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/app_error.dart';
import '../repositories/app_repository.dart';
import 'add_to_watchlist_movies_usecase.dart';

@Injectable()
class AddToWatchlistMoviesUseCaseImpl extends AddToWatchlistMoviesUseCase {

  AddToWatchlistMoviesUseCaseImpl(this.appRepository);

  final AppRepository appRepository;

  @override
  Future<Either<AppError, void>> call(int movieId) async {
    return appRepository.addToWatchlistMovies(movieId);
  }
}

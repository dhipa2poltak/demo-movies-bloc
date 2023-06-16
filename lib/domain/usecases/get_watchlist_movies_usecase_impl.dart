

import 'package:dartz/dartz.dart';
import 'package:demo_movies/domain/entities/movie_domain.dart';
import 'package:injectable/injectable.dart';

import '../entities/app_error.dart';
import '../repositories/app_repository.dart';
import 'get_watchlist_movies_usecase.dart';

@Injectable()
class GetWatchlistMoviesUseCaseImpl extends GetWatchlistMoviesUseCase {

  GetWatchlistMoviesUseCaseImpl(this.appRepository);

  final AppRepository appRepository;

  @override
  Future<Either<AppError, MovieDomain>> call(int page) async {
    return appRepository.getWatchlistMovies(page);
  }
}



import 'package:dartz/dartz.dart';
import 'package:demo_movies/domain/entities/movie_domain.dart';
import 'package:demo_movies/domain/usecases/search_movies_usecase.dart';
import 'package:injectable/injectable.dart';

import '../entities/app_error.dart';
import '../repositories/app_repository.dart';

@Injectable()
class SearchMoviesUseCaseImpl extends SearchMoviesUseCase {

  SearchMoviesUseCaseImpl(this.appRepository);

  final AppRepository appRepository;

  @override
  Future<Either<AppError, MovieDomain>> call(String query, int page) async {
    return appRepository.searchMovies(query, page);
  }
}

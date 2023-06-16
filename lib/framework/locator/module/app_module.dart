
import 'package:demo_movies/domain/usecases/add_to_watchlist_movies_usecase.dart';
import 'package:demo_movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:demo_movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:demo_movies/domain/usecases/get_popular_movies_usecase_impl.dart';
import 'package:demo_movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:demo_movies/domain/usecases/get_top_rated_movies_usecase_impl.dart';
import 'package:demo_movies/domain/usecases/get_upcoming_movies_usecase.dart';
import 'package:demo_movies/domain/usecases/get_watchlist_movies_usecase.dart';
import 'package:demo_movies/domain/usecases/is_in_watchlist_movies_usecase.dart';
import 'package:demo_movies/domain/usecases/remove_from_watchlist_movies_usecase.dart';
import 'package:demo_movies/domain/usecases/search_movies_usecase.dart';
import 'package:demo_movies/domain/usecases/search_movies_usecase_impl.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../app_config.dart';
import '../../../data/data_sources/app_data_source.dart';
import '../../../data/repositories/app_repository_impl.dart';
import '../../../domain/repositories/app_repository.dart';
import '../../../domain/usecases/add_to_watchlist_movies_usecase_impl.dart';
import '../../../domain/usecases/get_movie_details_usecase.dart';
import '../../../domain/usecases/get_movie_details_usecase_impl.dart';
import '../../../domain/usecases/get_now_playing_movies_usecase_impl.dart';
import '../../../domain/usecases/get_upcoming_movies_usecase_impl.dart';
import '../../../domain/usecases/get_watchlist_movies_usecase_impl.dart';
import '../../../domain/usecases/is_in_watchlist_movies_usecase_impl.dart';
import '../../../domain/usecases/remove_from_watchlist_movies_usecase_impl.dart';
import '../../data/core/auth_interceptor.dart';
import '../../data/data_sources/app_data_source_impl.dart';

@module
abstract class AppModule {

  @lazySingleton
  PrettyDioLogger get logger => PrettyDioLogger();

  @lazySingleton
  Dio provideDio(PrettyDioLogger loggger, AuthInterceptor authInterceptor) {
    var instance = Dio();

    if (AppConfig.appFlavor == Flavor.Dev) {
      instance.interceptors.add(loggger);
    }
    instance.interceptors.add(authInterceptor);

    return instance;
  }

  @lazySingleton
  AppDataSource provideAppDataSource(AppDataSourceImpl appDataSource) {
    return appDataSource;
  }

  @lazySingleton
  AppRepository provideAppRepository(AppRepositoryImpl appRepository) {
    return appRepository;
  }

  @injectable
  GetNowPlayingMoviesUseCase provideGetNowPlayingMoviesUseCase(GetNowPlayingMoviesUseCaseImpl impl) {
    return impl;
  }

  @injectable
  GetPopularMoviesUseCase provideGetPopularMoviesUseCase(GetPopularMoviesUseCaseImpl impl) {
    return impl;
  }

  @injectable
  GetTopRatedMoviesUseCase provideGetTopRatedMoviesUseCase(GetTopRatedMoviesUseCaseImpl impl) {
    return impl;
  }

  @injectable
  GetUpcomingMoviesUseCase provideGetUpcomingMoviesUseCase(GetUpcomingMoviesUseCaseImpl impl) {
    return impl;
  }

  @injectable
  SearchMoviesUseCase provideSearchMoviesUseCase(SearchMoviesUseCaseImpl impl) {
    return impl;
  }

  @injectable
  GetMovieDetailsUseCase provideGetMovieDetailsUseCase(GetMovieDetailsUseCaseImpl impl) {
    return impl;
  }

  @injectable
  GetWatchlistMoviesUseCase provideGetWatchlistMoviesUseCase(GetWatchlistMoviesUseCaseImpl impl) {
    return impl;
  }

  @injectable
  IsInWatchlistMoviesUseCase provideIsInWatchlistMoviesUseCase(IsInWatchlistMoviesUseCaseImpl impl) {
    return impl;
  }

  @injectable
  AddToWatchlistMoviesUseCase provideAddToWatchlistMoviesUseCase(AddToWatchlistMoviesUseCaseImpl impl) {
    return impl;
  }

  @injectable
  RemoveFromWatchlistMoviesUseCase provideRemoveFromWatchlistMoviesUseCase(RemoveFromWatchlistMoviesUseCaseImpl impl) {
    return impl;
  }
}

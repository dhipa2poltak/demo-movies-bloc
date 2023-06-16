// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:demo_movies/data/data_sources/app_data_source.dart' as _i8;
import 'package:demo_movies/data/repositories/app_repository_impl.dart' as _i9;
import 'package:demo_movies/domain/repositories/app_repository.dart' as _i11;
import 'package:demo_movies/domain/usecases/add_to_watchlist_movies_usecase.dart'
    as _i31;
import 'package:demo_movies/domain/usecases/add_to_watchlist_movies_usecase_impl.dart'
    as _i21;
import 'package:demo_movies/domain/usecases/get_movie_details_usecase.dart'
    as _i22;
import 'package:demo_movies/domain/usecases/get_movie_details_usecase_impl.dart'
    as _i12;
import 'package:demo_movies/domain/usecases/get_now_playing_movies_usecase.dart'
    as _i23;
import 'package:demo_movies/domain/usecases/get_now_playing_movies_usecase_impl.dart'
    as _i13;
import 'package:demo_movies/domain/usecases/get_popular_movies_usecase.dart'
    as _i24;
import 'package:demo_movies/domain/usecases/get_popular_movies_usecase_impl.dart'
    as _i14;
import 'package:demo_movies/domain/usecases/get_top_rated_movies_usecase.dart'
    as _i25;
import 'package:demo_movies/domain/usecases/get_top_rated_movies_usecase_impl.dart'
    as _i15;
import 'package:demo_movies/domain/usecases/get_upcoming_movies_usecase.dart'
    as _i26;
import 'package:demo_movies/domain/usecases/get_upcoming_movies_usecase_impl.dart'
    as _i16;
import 'package:demo_movies/domain/usecases/get_watchlist_movies_usecase.dart'
    as _i27;
import 'package:demo_movies/domain/usecases/get_watchlist_movies_usecase_impl.dart'
    as _i17;
import 'package:demo_movies/domain/usecases/is_in_watchlist_movies_usecase.dart'
    as _i28;
import 'package:demo_movies/domain/usecases/is_in_watchlist_movies_usecase_impl.dart'
    as _i18;
import 'package:demo_movies/domain/usecases/remove_from_watchlist_movies_usecase.dart'
    as _i29;
import 'package:demo_movies/domain/usecases/remove_from_watchlist_movies_usecase_impl.dart'
    as _i19;
import 'package:demo_movies/domain/usecases/search_movies_usecase.dart' as _i30;
import 'package:demo_movies/domain/usecases/search_movies_usecase_impl.dart'
    as _i20;
import 'package:demo_movies/framework/data/core/api_client.dart' as _i3;
import 'package:demo_movies/framework/data/core/auth_interceptor.dart' as _i6;
import 'package:demo_movies/framework/data/data_sources/app_data_source_impl.dart'
    as _i4;
import 'package:demo_movies/framework/locator/module/app_module.dart' as _i34;
import 'package:demo_movies/framework/router/app_router.dart' as _i5;
import 'package:demo_movies/page/movie_details/bloc/movie_details_bloc.dart'
    as _i32;
import 'package:demo_movies/page/movie_list/bloc/movie_list_bloc.dart' as _i33;
import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.ApiClient>(() => _i3.ApiClient.create());
    gh.lazySingleton<_i4.AppDataSourceImpl>(
        () => _i4.AppDataSourceImpl(gh<_i3.ApiClient>()));
    gh.lazySingleton<_i5.AppRouter>(() => _i5.AppRouter());
    gh.lazySingleton<_i6.AuthInterceptor>(() => _i6.AuthInterceptor());
    gh.lazySingleton<_i7.PrettyDioLogger>(() => appModule.logger);
    gh.lazySingleton<_i8.AppDataSource>(
        () => appModule.provideAppDataSource(gh<_i4.AppDataSourceImpl>()));
    gh.lazySingleton<_i9.AppRepositoryImpl>(
        () => _i9.AppRepositoryImpl(appDataSource: gh<_i8.AppDataSource>()));
    gh.lazySingleton<_i10.Dio>(() => appModule.provideDio(
          gh<_i7.PrettyDioLogger>(),
          gh<_i6.AuthInterceptor>(),
        ));
    gh.lazySingleton<_i11.AppRepository>(
        () => appModule.provideAppRepository(gh<_i9.AppRepositoryImpl>()));
    gh.factory<_i12.GetMovieDetailsUseCaseImpl>(
        () => _i12.GetMovieDetailsUseCaseImpl(gh<_i11.AppRepository>()));
    gh.factory<_i13.GetNowPlayingMoviesUseCaseImpl>(
        () => _i13.GetNowPlayingMoviesUseCaseImpl(gh<_i11.AppRepository>()));
    gh.factory<_i14.GetPopularMoviesUseCaseImpl>(
        () => _i14.GetPopularMoviesUseCaseImpl(gh<_i11.AppRepository>()));
    gh.factory<_i15.GetTopRatedMoviesUseCaseImpl>(
        () => _i15.GetTopRatedMoviesUseCaseImpl(gh<_i11.AppRepository>()));
    gh.factory<_i16.GetUpcomingMoviesUseCaseImpl>(
        () => _i16.GetUpcomingMoviesUseCaseImpl(gh<_i11.AppRepository>()));
    gh.factory<_i17.GetWatchlistMoviesUseCaseImpl>(
        () => _i17.GetWatchlistMoviesUseCaseImpl(gh<_i11.AppRepository>()));
    gh.factory<_i18.IsInWatchlistMoviesUseCaseImpl>(
        () => _i18.IsInWatchlistMoviesUseCaseImpl(gh<_i11.AppRepository>()));
    gh.factory<_i19.RemoveFromWatchlistMoviesUseCaseImpl>(() =>
        _i19.RemoveFromWatchlistMoviesUseCaseImpl(gh<_i11.AppRepository>()));
    gh.factory<_i20.SearchMoviesUseCaseImpl>(
        () => _i20.SearchMoviesUseCaseImpl(gh<_i11.AppRepository>()));
    gh.factory<_i21.AddToWatchlistMoviesUseCaseImpl>(
        () => _i21.AddToWatchlistMoviesUseCaseImpl(gh<_i11.AppRepository>()));
    gh.factory<_i22.GetMovieDetailsUseCase>(() => appModule
        .provideGetMovieDetailsUseCase(gh<_i12.GetMovieDetailsUseCaseImpl>()));
    gh.factory<_i23.GetNowPlayingMoviesUseCase>(() =>
        appModule.provideGetNowPlayingMoviesUseCase(
            gh<_i13.GetNowPlayingMoviesUseCaseImpl>()));
    gh.factory<_i24.GetPopularMoviesUseCase>(() =>
        appModule.provideGetPopularMoviesUseCase(
            gh<_i14.GetPopularMoviesUseCaseImpl>()));
    gh.factory<_i25.GetTopRatedMoviesUseCase>(() =>
        appModule.provideGetTopRatedMoviesUseCase(
            gh<_i15.GetTopRatedMoviesUseCaseImpl>()));
    gh.factory<_i26.GetUpcomingMoviesUseCase>(() =>
        appModule.provideGetUpcomingMoviesUseCase(
            gh<_i16.GetUpcomingMoviesUseCaseImpl>()));
    gh.factory<_i27.GetWatchlistMoviesUseCase>(() =>
        appModule.provideGetWatchlistMoviesUseCase(
            gh<_i17.GetWatchlistMoviesUseCaseImpl>()));
    gh.factory<_i28.IsInWatchlistMoviesUseCase>(() =>
        appModule.provideIsInWatchlistMoviesUseCase(
            gh<_i18.IsInWatchlistMoviesUseCaseImpl>()));
    gh.factory<_i29.RemoveFromWatchlistMoviesUseCase>(() =>
        appModule.provideRemoveFromWatchlistMoviesUseCase(
            gh<_i19.RemoveFromWatchlistMoviesUseCaseImpl>()));
    gh.factory<_i30.SearchMoviesUseCase>(() => appModule
        .provideSearchMoviesUseCase(gh<_i20.SearchMoviesUseCaseImpl>()));
    gh.factory<_i31.AddToWatchlistMoviesUseCase>(() =>
        appModule.provideAddToWatchlistMoviesUseCase(
            gh<_i21.AddToWatchlistMoviesUseCaseImpl>()));
    gh.factory<_i32.MovieDetailsBloc>(() => _i32.MovieDetailsBloc(
          gh<_i22.GetMovieDetailsUseCase>(),
          gh<_i28.IsInWatchlistMoviesUseCase>(),
          gh<_i31.AddToWatchlistMoviesUseCase>(),
          gh<_i29.RemoveFromWatchlistMoviesUseCase>(),
        ));
    gh.factory<_i33.MovieListBloc>(() => _i33.MovieListBloc(
          gh<_i25.GetTopRatedMoviesUseCase>(),
          gh<_i26.GetUpcomingMoviesUseCase>(),
          gh<_i23.GetNowPlayingMoviesUseCase>(),
          gh<_i24.GetPopularMoviesUseCase>(),
          gh<_i27.GetWatchlistMoviesUseCase>(),
          gh<_i30.SearchMoviesUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i34.AppModule {}

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:demo_movies/common/app_constants.dart';
import 'package:demo_movies/domain/entities/app_error.dart';
import 'package:demo_movies/domain/entities/movie_domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_now_playing_movies_usecase.dart';
import '../../../domain/usecases/get_popular_movies_usecase.dart';
import '../../../domain/usecases/get_top_rated_movies_usecase.dart';
import '../../../domain/usecases/get_upcoming_movies_usecase.dart';
import '../../../domain/usecases/get_watchlist_movies_usecase.dart';
import '../../../domain/usecases/search_movies_usecase.dart';
import 'movie_list_event.dart';
import 'movie_list_state.dart';

@Injectable()
class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {

  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  final GetUpcomingMoviesUseCase getUpcomingMoviesUseCase;
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetWatchlistMoviesUseCase getWatchlistMoviesUseCase;
  final SearchMoviesUseCase searchMoviesUseCase;

  MovieListBloc(
      this.getTopRatedMoviesUseCase,
      this.getUpcomingMoviesUseCase,
      this.getNowPlayingMoviesUseCase,
      this.getPopularMoviesUseCase,
      this.getWatchlistMoviesUseCase,
      this.searchMoviesUseCase
  ) : super(MovieListState()) {
    on<MovieListPageInitiated>((event, emit) async {
      await loadData(event.selectedIndex, "", state.page + 1, emit);
    });

    on<MovieListPageLoadMoreData>((event, emit) async {
      if (!state.isLoading) {
        await loadData(state.selectedIndex, state.keyword, state.page + 1, emit);
      }
    });

    on<ReloadWatchlistMovies>((event, emit) async {
      emit(state.copyWith(page: 0, movies: [], isLastPage: false));
      await loadData(state.selectedIndex, state.keyword, state.page + 1, emit);
    });

    on<SearchMovies>((event, emit) async {
      emit(state.copyWith(page: 0, movies: [], isLastPage: false));
      await loadData(state.selectedIndex, event.keyword, state.page + 1, emit);
    });
  }

  Future<void> loadData(int selectedIndex, String keyword, int page, Emitter<MovieListState> emit) async {
    if (state.isLastPage) return;

    emit(state.copyWith(isLoading: true));

    Either<AppError, MovieDomain>? result;
    switch (selectedIndex) {
      case AppConstants.TOP_RATED_MOVIES_INDEX: {
        result = await getTopRatedMoviesUseCase(page);
      }
      break;
      case AppConstants.UPCOMING_MOVIES_INDEX: {
        result = await getUpcomingMoviesUseCase(page);
      }
      break;
      case AppConstants.NOW_PLAYING_MOVIES_INDEX: {
        result = await getNowPlayingMoviesUseCase(page);
      }
      break;
      case AppConstants.POPULAR_MOVIES_INDEX: {
        result = await getPopularMoviesUseCase(page);
      }
      break;
      case AppConstants.SEARCH_MOVIES_INDEX: {
        emit(state.copyWith(selectedIndex: selectedIndex));
        if (keyword.isNotEmpty) {
          emit(state.copyWith(keyword: keyword));
          result = await searchMoviesUseCase(keyword, page);
        }
      }
      break;
      case AppConstants.WATCHLIST_MOVIES_INDEX: {
        result = await getWatchlistMoviesUseCase(page);
      }
    }

    result?.fold((appError) {
      emit(state.copyWith(errorMessage: appError.message));
    }, (movieDomain) {
      final movies = movieDomain.results;

      if (movies.isNotEmpty) {
        final existingMovies = state.movies;
        final newMovies = <MovieEntity>[];
        newMovies.addAll(existingMovies);
        newMovies.addAll(movies);

        emit(state.copyWith(selectedIndex: selectedIndex));
        emit(state.copyWith(page: page));
        emit(state.copyWith(movies: newMovies));
      } else {
        emit(state.copyWith(isLastPage: true));
      }
    });

    emit(state.copyWith(isLoading: false));
  }
}

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/add_to_watchlist_movies_usecase.dart';
import '../../../domain/usecases/get_movie_details_usecase.dart';
import '../../../domain/usecases/is_in_watchlist_movies_usecase.dart';
import '../../../domain/usecases/remove_from_watchlist_movies_usecase.dart';
import 'movie_details_event.dart';
import 'movie_details_state.dart';

@Injectable()
class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final IsInWatchlistMoviesUseCase isInWatchlistMoviesUseCase;
  final AddToWatchlistMoviesUseCase addToWatchlistMoviesUseCase;
  final RemoveFromWatchlistMoviesUseCase removeFromWatchlistMoviesUseCase;

  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.isInWatchlistMoviesUseCase,
    this.addToWatchlistMoviesUseCase,
    this.removeFromWatchlistMoviesUseCase
  ) : super(MovieDetailsState()) {
    on<MovieDetailsPageInitiated>((event, emit) async {
      await onMovieDetailsPageInitiated(event, emit);
    });

    on<AddToWatchlistMovies>((event, emit) async {
      await onAddToWatchlistMovies(emit);
    });

    on<RemoveFromWatchlistMovies>((event, emit) async {
      await onRemoveFromWatchlistMovies(emit);
    });
  }

  Future<void> onMovieDetailsPageInitiated(MovieDetailsPageInitiated event, Emitter<MovieDetailsState> emit) async {
    bool isError = false;

    emit(state.copyWith(isLoading: true));

    final movieId = event.movieId;
    final result = await getMovieDetailsUseCase(movieId);
    result.fold((appError) {
      emit(state.copyWith(errorMessage: appError.message));
      isError = true;
    }, (movieDetailsDomain) {
      emit(state.copyWith(movieId: movieId));
      emit(state.copyWith(title: movieDetailsDomain.title));
      emit(state.copyWith(description: movieDetailsDomain.overview));

      if (movieDetailsDomain.imageUrl.isNotEmpty) {
        emit(state.copyWith(imageUrl: movieDetailsDomain.imageUrl));
      }
    });

    if (isError) {
      emit(state.copyWith(isLoading: false));
    } else {
      await isInWatchlistMovies(movieId, emit);
    }
  }

  Future<void> isInWatchlistMovies(int movieId, Emitter<MovieDetailsState> emit) async {
    final result = await isInWatchlistMoviesUseCase(movieId);
    result.fold((appError) {
      emit(state.copyWith(errorMessage: appError.message));
    }, (watchlistMoviesDomain) {
      emit(state.copyWith(isInWatchlistMovies: watchlistMoviesDomain.watchlist));
    });

    emit(state.copyWith(isLoading: false));
  }

  Future<void> onAddToWatchlistMovies(Emitter<MovieDetailsState> emit) async {
    bool isError = false;

    emit(state.copyWith(isLoading: true));

    final movieId = state.movieId;
    final result = await addToWatchlistMoviesUseCase(movieId);
    result.fold((appError) {
      emit(state.copyWith(errorMessage: appError.message));
      isError = true;
    }, (ignore) {

    });

    if (isError) {
      emit(state.copyWith(isLoading: false));
    } else {
      await isInWatchlistMovies(movieId, emit);
    }
  }

  Future<void> onRemoveFromWatchlistMovies(Emitter<MovieDetailsState> emit) async {
    bool isError = false;

    emit(state.copyWith(isLoading: true));

    final movieId = state.movieId;
    final result = await removeFromWatchlistMoviesUseCase(movieId);
    result.fold((appError) {
      emit(state.copyWith(errorMessage: appError.message));
      isError = true;
    }, (ignore) {

    });

    if (isError) {
      emit(state.copyWith(isLoading: false));
    } else {
      await isInWatchlistMovies(movieId, emit);
    }
  }
}

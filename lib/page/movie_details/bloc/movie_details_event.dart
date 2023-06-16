
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_details_event.freezed.dart';

@immutable
abstract class MovieDetailsEvent {
  const MovieDetailsEvent();
}

@Freezed()
class MovieDetailsPageInitiated extends MovieDetailsEvent with _$MovieDetailsPageInitiated {
  const factory MovieDetailsPageInitiated(int movieId) = _MovieDetailsPageInitiated;
}

@Freezed()
class AddToWatchlistMovies extends MovieDetailsEvent with _$AddToWatchlistMovies {
  const factory AddToWatchlistMovies() = _AddToWatchlistMovies;
}

@Freezed()
class RemoveFromWatchlistMovies extends MovieDetailsEvent with _$RemoveFromWatchlistMovies {
  const factory RemoveFromWatchlistMovies() = _RemoveFromWatchlistMovies;
}

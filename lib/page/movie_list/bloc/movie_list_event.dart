import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_list_event.freezed.dart';

@immutable
abstract class MovieListEvent {
  const MovieListEvent();
}

@Freezed()
class MovieListPageInitiated extends MovieListEvent with _$MovieListPageInitiated {
  const factory MovieListPageInitiated(int selectedIndex) = _MovieListPageInitiated;
}

@Freezed()
class MovieListPageLoadMoreData extends MovieListEvent with _$MovieListPageLoadMoreData {
  const factory MovieListPageLoadMoreData() = _MovieListPageLoadMoreData;
}

@Freezed()
class ReloadWatchlistMovies extends MovieListEvent with _$ReloadWatchlistMovies {
  const factory ReloadWatchlistMovies() = _ReloadWatchlistMovies;
}

@Freezed()
class SearchMovies extends MovieListEvent with _$SearchMovies {
  const factory SearchMovies(String keyword) = _SearchMovies;
}

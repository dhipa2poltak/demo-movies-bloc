
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_remove_watchlist_movie.freezed.dart';
part 'add_remove_watchlist_movie.g.dart';

@Freezed()
class AddRemoveWatchlistMovie with _$AddRemoveWatchlistMovie {
  const AddRemoveWatchlistMovie._();

  const factory AddRemoveWatchlistMovie({
    @JsonKey(name: 'movie_id') @Default(-1) int movieId,
    @JsonKey(name: 'movie_watchlist') @Default(false) bool movieWatchlist,
  }) = _AddRemoveWatchlistMovie;

  factory AddRemoveWatchlistMovie.fromJson(Map<String, dynamic> json) => _$AddRemoveWatchlistMovieFromJson(json);
}

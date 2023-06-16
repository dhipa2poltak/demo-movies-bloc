
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'watchlist_movies_domain.freezed.dart';

@Freezed()
class WatchlistMoviesDomain with _$WatchlistMoviesDomain {

  const factory WatchlistMoviesDomain({
    @Default(-1) int id,
    @Default(false) bool favorite,
    @Default(false) bool rated,
    @Default(false) bool watchlist,
  }) = _WatchlistMoviesDomain;
}

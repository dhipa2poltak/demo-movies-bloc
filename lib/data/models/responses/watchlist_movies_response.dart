
import 'package:demo_movies/domain/entities/watchlist_movies_domain.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'watchlist_movies_response.freezed.dart';
part 'watchlist_movies_response.g.dart';

@Freezed()
class WatchlistMoviesResponse with _$WatchlistMoviesResponse {
  const WatchlistMoviesResponse._();

  const factory WatchlistMoviesResponse({
    @JsonKey(name: 'id') @Default(-1) int id,
    @JsonKey(name: 'favorite') @Default(false) bool favorite,
    @JsonKey(name: 'rated') @Default(false) bool rated,
    @JsonKey(name: 'watchlist') @Default(false) bool watchlist,
  }) = _WatchlistMoviesResponse;

  factory WatchlistMoviesResponse.fromJson(Map<String, dynamic> json) => _$WatchlistMoviesResponseFromJson(json);

  WatchlistMoviesDomain toDomain() {
    return WatchlistMoviesDomain(
      id: id,
      favorite: favorite,
      rated: rated,
      watchlist: watchlist
    );
  }
}

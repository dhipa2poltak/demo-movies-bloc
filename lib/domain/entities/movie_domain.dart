
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'movie_entity.dart';

part 'movie_domain.freezed.dart';

@Freezed()
class MovieDomain with _$MovieDomain {
  const factory MovieDomain({
    @Default(-1) int page,
    @Default(<MovieEntity>[]) List<MovieEntity> results,
    @Default(-1) int totalPages,
    @Default(-1) int totalResults
  }) = _MovieDomain;
}

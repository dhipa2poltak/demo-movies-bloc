
import 'package:demo_movies/data/models/movie.dart';
import 'package:demo_movies/data/models/the_date.dart';
import 'package:demo_movies/domain/entities/movie_domain.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../constants.dart';

part 'movie_response.freezed.dart';
part 'movie_response.g.dart';

@Freezed()
class MovieResponse with _$MovieResponse {
  const MovieResponse._();

  const factory MovieResponse({
    @JsonKey(name: 'dates') @Default(TheDate(maximum: '', minimum: '')) TheDate dates,
    @JsonKey(name: 'page') @Default(-1) int page,
    @JsonKey(name: 'results') @Default(<Movie>[]) List<Movie> results,
    @JsonKey(name: 'total_pages') @Default(-1) int totalPages,
    @JsonKey(name: 'total_results') @Default(-1) int totalResults,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);

  MovieDomain toDomain() {
    final movieEntities = results.map((e) => MovieEntity(
        id: e.id,
        title: e.title,
        overview: e.overview,
        imageUrl: e.posterPath.isNotEmpty ? Constants.IMAGE_URL_BASE_PATH + e.posterPath : ''
    ));

    return MovieDomain(
        page: page,
        results: movieEntities.toList(),
        totalPages: totalPages,
        totalResults: totalResults
    );
  }
}

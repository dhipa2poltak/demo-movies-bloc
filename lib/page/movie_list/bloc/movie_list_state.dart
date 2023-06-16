
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/movie_entity.dart';

part 'movie_list_state.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class MovieListState with _$MovieListState {
  factory MovieListState({
    @Default(false) bool isLoading,
    @Default(<MovieEntity>[]) List<MovieEntity> movies,
    @Default('') String errorMessage,
    @Default(-1) int selectedIndex,
    @Default(0) int page,
    @Default(false) bool isLastPage,
    @Default('') String keyword
  }) = _MovieListState;
}

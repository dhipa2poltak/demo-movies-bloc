
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'the_date.freezed.dart';
part 'the_date.g.dart';

@Freezed()
class TheDate with _$TheDate {
  const factory TheDate({
    @JsonKey(name: 'maximum') @Default('') String maximum,
    @JsonKey(name: 'minimum') @Default('') String minimum,
  }) = _TheDate;

  factory TheDate.fromJson(Map<String, dynamic> json) => _$TheDateFromJson(json);
}

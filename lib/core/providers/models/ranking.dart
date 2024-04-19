import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rankai/core/providers/models/entity.dart';

part 'ranking.freezed.dart';
part 'ranking.g.dart';

@freezed
class Ranking with _$Ranking {
  const factory Ranking({
    required String id,
    required String title,
    required String prompt,
    required DateTime promptDate,
    @Default(<Entity>[]) List<Entity> entities,
  }) = _Ranking;

  factory Ranking.fromJson(Map<String, dynamic> json) =>
      _$RankingFromJson(json);
}

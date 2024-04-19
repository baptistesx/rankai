import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity.freezed.dart';
part 'entity.g.dart';

@freezed
class Entity with _$Entity {
  const factory Entity({
    required String id,
    int? ranking,
    double? rating,
    String? author,
    String? imageUrl,
    DateTime? date,
    String? description,
    String? name,
    String? rankingSourceUrl,
    String? category,
    String? price,
  }) = _Entity;

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);
}

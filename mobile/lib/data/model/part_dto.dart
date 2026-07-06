import 'package:freezed_annotation/freezed_annotation.dart';

part 'part_dto.freezed.dart';
part 'part_dto.g.dart';

@freezed
abstract class PartDto with _$PartDto {
  factory PartDto({
    required int id,
    required String code,
    required String description,
    required DateTime updatedAt,
  }) = _PartDto;

  factory PartDto.fromJson(Map<String, dynamic> json) =>
      _$PartDtoFromJson(json);
}

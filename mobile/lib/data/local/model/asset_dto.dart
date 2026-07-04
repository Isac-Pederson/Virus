import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_dto.freezed.dart';
part 'asset_dto.g.dart';

@freezed
abstract class AssetDto with _$AssetDto {
  factory AssetDto({
    required int id,
    required String code,
    required String description,
    required DateTime updatedAt,
  }) = _AssetDto;

  factory AssetDto.fromJson(Map<String, dynamic> json) =>
      _$AssetDtoFromJson(json);
}

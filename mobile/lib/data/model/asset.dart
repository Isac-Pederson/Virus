import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset.freezed.dart';
part 'asset.g.dart';

@freezed
abstract class Asset with _$Asset{
  factory Asset({
    required int id,
    required String code,
    required String description,
    required DateTime updatedAt,
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) =>
      _$AssetFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:virus/data/local/model/asset_dto.dart';
import 'package:virus/data/local/model/employee_dto.dart';
import 'package:virus/data/local/model/part_dto.dart';
import 'package:virus/data/local/model/selection_item_dto.dart';

part 'task_dto.freezed.dart';
part 'task_dto.g.dart';

@freezed
abstract class TaskDto with _$TaskDto {
  factory TaskDto({
    required int id,
    required String code,
    required String description,
    required DateTime updatedAt,
  }) = _TaskDto;

  factory TaskDto.fromJson(Map<String, dynamic> json) => _$TaskDtoFromJson(json);
}

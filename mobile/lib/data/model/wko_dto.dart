
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:virus/data/model/asset_dto.dart';
import 'package:virus/data/model/employee_dto.dart';
import 'package:virus/data/model/part_dto.dart';
import 'package:virus/data/model/selection_item_dto.dart';

part 'wko_dto.freezed.dart';
part 'wko_dto.g.dart';

@freezed
abstract class WkoDto with _$WkoDto{
  factory WkoDto({
    required int id,
    required String code,
    required String description,
    required DateTime updatedAt,  
    required SelectionItem status,
    DateTime? openDate,  
    DateTime? dueDate,  
    DateTime? closedDate,  
    bool? completedNotColsed,  
    SelectionItem? type,
    SelectionItem? category,
    List<AssetDto>? assets,
    List<PartDto>? parts,
    List<EmployeeDto>? employee
  }) = _WkoDto;

  
  factory WkoDto.fromJson(Map<String,dynamic> json) => _$WkoDtoFromJson(json);  


}
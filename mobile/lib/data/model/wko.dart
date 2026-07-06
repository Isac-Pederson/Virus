
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:virus/data/model/asset.dart';
import 'package:virus/data/model/employee.dart';
import 'package:virus/data/model/part.dart';
import 'package:virus/data/model/selection_item.dart';

part 'wko.freezed.dart';
part 'wko.g.dart';

@freezed
abstract class Wko with _$Wko{
  factory Wko({
    required String id,
    required String code,
    required String description,
    required DateTime updatedAt,  
    required SelectionItem status,
    Map<String,dynamic>? recordData,
    DateTime? openDate,  
    DateTime? dueDate,  
    DateTime? closedDate,  
    bool? completedNotClosed,  
    SelectionItem? type,
    SelectionItem? category,
    List<Asset>? assets,
    List<Part>? parts,
    List<Employee>? employee
  }) = _Wko;

  
  factory Wko.fromJson(Map<String,dynamic> json) => _$WkoFromJson(json);  


}
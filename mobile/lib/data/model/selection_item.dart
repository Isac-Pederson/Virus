import 'package:freezed_annotation/freezed_annotation.dart';

part 'selection_item.freezed.dart';
part 'selection_item.g.dart';

@freezed
abstract class SelectionItem with _$SelectionItem {
  factory SelectionItem({
    required int id,
    required String code,
    required String description,
    required DateTime updatedAt,
  }) = _SelectionItem;

  factory SelectionItem.fromJson(Map<String, dynamic> json) =>
      _$SelectionItemFromJson(json);
}

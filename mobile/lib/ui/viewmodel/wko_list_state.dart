import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:virus/data/model/wko.dart';

part 'wko_list_state.freezed.dart';

@freezed
abstract class WkoListState with _$WkoListState {
  const factory WkoListState({
    @Default([]) List<Wko> items,
    @Default(false) bool isLoading,
    String? error,
  }) = _WkoListState;
}
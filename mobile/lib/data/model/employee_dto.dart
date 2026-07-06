import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_dto.freezed.dart';
part 'employee_dto.g.dart';

@freezed
abstract class EmployeeDto with _$EmployeeDto {
  factory EmployeeDto({
    required int id,
    required String code,
    required String name,
    required DateTime updatedAt,
  }) = _EmployeeDto;

  factory EmployeeDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeDtoFromJson(json);
}

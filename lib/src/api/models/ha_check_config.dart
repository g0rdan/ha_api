import 'package:ha_api/src/system/exact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ha_check_config.g.dart';

@JsonSerializable(createToJson: false)
class HaCheckConfig implements Exact {
  const HaCheckConfig({
    required this.result,
    required this.errors,
    required this.warnings,
  });

  @JsonKey(name: 'result')
  final String result;

  @JsonKey(name: 'errors')
  final dynamic errors;

  @JsonKey(name: 'warnings')
  final dynamic warnings;

  factory HaCheckConfig.fromJson(Map<String, dynamic> json) =>
      _$HaCheckConfigFromJson(json);

  @override
  Iterable<Object?> get properties => [
        result,
        errors,
        warnings,
      ];
}

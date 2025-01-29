import 'package:ha_api/src/system/exact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_config_response.g.dart';

@JsonSerializable()
class CheckConfigResponse implements Exact {
  const CheckConfigResponse({
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

  factory CheckConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckConfigResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckConfigResponseToJson(this);

  @override
  Iterable<Object?> get properties => [
        result,
        errors,
        warnings,
      ];
}

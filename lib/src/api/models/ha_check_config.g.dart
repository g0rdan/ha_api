// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_config_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HaCheckConfig _$HaCheckConfigFromJson(Map<String, dynamic> json) =>
    HaCheckConfig(
      result: json['result'] as String,
      errors: json['errors'],
      warnings: json['warnings'],
    );

Map<String, dynamic> _$HaCheckConfigToJson(HaCheckConfig instance) =>
    <String, dynamic>{
      'result': instance.result,
      'errors': instance.errors,
      'warnings': instance.warnings,
    };

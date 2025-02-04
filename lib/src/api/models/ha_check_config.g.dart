// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ha_check_config.dart';

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

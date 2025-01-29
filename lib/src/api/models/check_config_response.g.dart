// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_config_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckConfigResponse _$CheckConfigResponseFromJson(Map<String, dynamic> json) =>
    CheckConfigResponse(
      result: json['result'] as String,
      errors: json['errors'],
      warnings: json['warnings'],
    );

Map<String, dynamic> _$CheckConfigResponseToJson(
        CheckConfigResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'errors': instance.errors,
      'warnings': instance.warnings,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      domain: json['domain'] as String?,
      services: json['services'],
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'domain': instance.domain,
      'services': instance.services,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ha_services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicesDomain _$ServicesDomainFromJson(Map<String, dynamic> json) =>
    ServicesDomain(
      domain: json['domain'] as String?,
      services: (json['services'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Service.fromJson(e as Map<String, dynamic>)),
      ),
    );

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      name: json['name'] as String,
      description: json['description'] as String,
      fields: json['fields'] as Map<String, dynamic>?,
      target: json['target'] as Map<String, dynamic>?,
    );

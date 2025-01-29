// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

State _$StateFromJson(Map<String, dynamic> json) => State(
      entityId: json['entity_id'] as String?,
      state: json['state'] as String?,
      attributes: json['attributes'] as Map<String, dynamic>?,
      lastChanged: json['last_changed'] == null
          ? null
          : DateTime.parse(json['last_changed'] as String),
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
    );

Map<String, dynamic> _$StateToJson(State instance) => <String, dynamic>{
      'entity_id': instance.entityId,
      'state': instance.state,
      'attributes': instance.attributes,
      'last_changed': instance.lastChanged?.toIso8601String(),
      'last_updated': instance.lastUpdated?.toIso8601String(),
    };

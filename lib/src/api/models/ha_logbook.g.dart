// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ha_logbook.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Logbook _$LogbookFromJson(Map<String, dynamic> json) => Logbook(
      entityId: json['entity_id'] as String?,
      state: json['state'] as String?,
      name: json['name'] as String?,
      when:
          json['when'] == null ? null : DateTime.parse(json['when'] as String),
      contextUserId: json['context_user_id'] as String?,
      contextDomain: json['context_domain'] as String?,
      contextService: json['context_service'] as String?,
      contextEventType: json['context_event_type'] as String?,
    );

Map<String, dynamic> _$LogbookToJson(Logbook instance) => <String, dynamic>{
      'entity_id': instance.entityId,
      'state': instance.state,
      'name': instance.name,
      'when': instance.when?.toIso8601String(),
      'context_user_id': instance.contextUserId,
      'context_domain': instance.contextDomain,
      'context_service': instance.contextService,
      'context_event_type': instance.contextEventType,
    };

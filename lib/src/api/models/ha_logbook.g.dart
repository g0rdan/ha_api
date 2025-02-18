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

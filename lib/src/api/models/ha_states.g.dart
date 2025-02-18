// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ha_states.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HaState _$HaStateFromJson(Map<String, dynamic> json) => HaState(
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

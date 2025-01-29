// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendars_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarEntity _$CalendarEntityFromJson(Map<String, dynamic> json) =>
    CalendarEntity(
      entityId: json['entity_id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CalendarEntityToJson(CalendarEntity instance) =>
    <String, dynamic>{
      'entity_id': instance.entityId,
      'name': instance.name,
    };

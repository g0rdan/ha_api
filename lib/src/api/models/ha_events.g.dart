// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ha_events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      event: json['event'] as String?,
      listenerCount: (json['listener_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'event': instance.event,
      'listener_count': instance.listenerCount,
    };

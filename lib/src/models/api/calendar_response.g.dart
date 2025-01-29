// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Calendar _$CalendarFromJson(Map<String, dynamic> json) => Calendar(
      summary: json['summary'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
      start: json['start'] == null
          ? null
          : CalendarDateTime.fromJson(json['start'] as Map<String, dynamic>),
      end: json['end'] == null
          ? null
          : CalendarDateTime.fromJson(json['end'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CalendarToJson(Calendar instance) => <String, dynamic>{
      'summary': instance.summary,
      'description': instance.description,
      'location': instance.location,
      'start': instance.start,
      'end': instance.end,
    };

CalendarDateTime _$CalendarDateTimeFromJson(Map<String, dynamic> json) =>
    CalendarDateTime(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$CalendarDateTimeToJson(CalendarDateTime instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'dateTime': instance.dateTime?.toIso8601String(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ha_calendar.dart';

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

CalendarDateTime _$CalendarDateTimeFromJson(Map<String, dynamic> json) =>
    CalendarDateTime(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
    );

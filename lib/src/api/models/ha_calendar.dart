import 'package:ha_api/src/system/exact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'calendar_response.g.dart';

class HaCalendar implements Exact {
  const HaCalendar({
    required this.data,
  });

  final List<Calendar>? data;

  factory HaCalendar.fromResponse(dynamic list) {
    return HaCalendar(
      data: (list as Iterable).map((e) => Calendar.fromJson(e)).toList(),
    );
  }

  @override
  Iterable<Object?> get properties => data ?? [];
}

@JsonSerializable()
class Calendar implements Exact {
  const Calendar({
    required this.summary,
    required this.description,
    required this.location,
    required this.start,
    required this.end,
  });

  @JsonKey(name: 'summary')
  final String? summary;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'location')
  final String? location;

  @JsonKey(name: 'start')
  final CalendarDateTime? start;

  @JsonKey(name: 'end')
  final CalendarDateTime? end;

  factory Calendar.fromJson(Map<String, dynamic> json) =>
      _$CalendarFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarToJson(this);

  @override
  Iterable<Object?> get properties => [
        description,
        end,
        location,
        start,
        summary,
      ];
}

@JsonSerializable()
class CalendarDateTime implements Exact {
  const CalendarDateTime({
    required this.date,
    required this.dateTime,
  });

  @JsonKey(name: 'date')
  final DateTime? date;

  @JsonKey(name: 'dateTime')
  final DateTime? dateTime;

  factory CalendarDateTime.fromJson(Map<String, dynamic> json) =>
      _$CalendarDateTimeFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarDateTimeToJson(this);

  @override
  Iterable<Object?> get properties => [
        date,
        dateTime,
      ];
}

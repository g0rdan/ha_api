import 'package:ha/src/system/exact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'calendars_response.g.dart';

class CalendarsResponse implements Exact {
  const CalendarsResponse({
    required this.data,
  });

  final List<CalendarEntity>? data;

  factory CalendarsResponse.fromResponse(dynamic list) {
    return CalendarsResponse(
      data: (list as Iterable).map((e) => CalendarEntity.fromJson(e)).toList(),
    );
  }

  @override
  Iterable<Object?> get properties => data ?? [];
}

@JsonSerializable()
class CalendarEntity implements Exact {
  const CalendarEntity({
    required this.entityId,
    required this.name,
  });

  @JsonKey(name: 'entity_id')
  final String? entityId;

  @JsonKey(name: 'name')
  final String? name;

  factory CalendarEntity.fromJson(Map<String, dynamic> json) =>
      _$CalendarEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarEntityToJson(this);

  @override
  Iterable<Object?> get properties => [
        entityId,
        name,
      ];
}

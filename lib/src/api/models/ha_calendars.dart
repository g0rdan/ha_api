import 'package:ha_api/src/system/exact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ha_calendars.g.dart';

class HaCalendars implements Exact {
  const HaCalendars({
    required this.data,
  });

  final List<CalendarEntity>? data;

  factory HaCalendars.fromResponse(dynamic list) {
    return HaCalendars(
      data: (list as Iterable).map((e) => CalendarEntity.fromJson(e)).toList(),
    );
  }

  @override
  Iterable<Object?> get properties => data ?? [];
}

@JsonSerializable(createToJson: false)
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

  @override
  Iterable<Object?> get properties => [
        entityId,
        name,
      ];
}

import 'package:ha_api/src/system/exact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ha_events.g.dart';

class HaEvents implements Exact {
  const HaEvents({
    this.data,
  });

  final List<Event>? data;

  factory HaEvents.fromResponse(dynamic list) {
    return HaEvents(
      data: (list as Iterable).map((e) => Event.fromJson(e)).toList(),
    );
  }

  @override
  Iterable<Object?> get properties => data ?? [];
}

@JsonSerializable()
class Event implements Exact {
  const Event({
    this.event,
    this.listenerCount,
  });

  @JsonKey(name: 'event')
  final String? event;
  @JsonKey(name: 'listener_count')
  final int? listenerCount;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);

  @override
  Iterable<Object?> get properties => [
        event,
        listenerCount,
      ];
}

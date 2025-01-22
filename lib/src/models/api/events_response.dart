import 'package:ha/src/system/exact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'events_response.g.dart';

class EventsResponse implements Exact {
  const EventsResponse({
    this.data,
  });

  final List<Event>? data;

  factory EventsResponse.fromResponse(dynamic list) {
    return EventsResponse(
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

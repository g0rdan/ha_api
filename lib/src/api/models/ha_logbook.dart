import 'package:ha_api/src/system/exact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logbook_response.g.dart';

class HaLogbook implements Exact {
  const HaLogbook({
    this.data,
  });

  final List<Logbook>? data;

  factory HaLogbook.fromResponse(dynamic list) {
    return HaLogbook(
      data: (list as Iterable).map((e) => Logbook.fromJson(e)).toList(),
    );
  }

  @override
  Iterable<Object?> get properties => data ?? [];
}

@JsonSerializable()
class Logbook implements Exact {
  const Logbook({
    this.entityId,
    this.state,
    this.name,
    this.when,
    this.contextUserId,
    this.contextDomain,
    this.contextService,
    this.contextEventType,
  });

  @JsonKey(name: 'entity_id')
  final String? entityId;

  @JsonKey(name: 'state')
  final String? state;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'when')
  final DateTime? when;

  @JsonKey(name: 'context_user_id')
  final String? contextUserId;

  @JsonKey(name: 'context_domain')
  final String? contextDomain;

  @JsonKey(name: 'context_service')
  final String? contextService;

  @JsonKey(name: 'context_event_type')
  final String? contextEventType;

  factory Logbook.fromJson(Map<String, dynamic> json) =>
      _$LogbookFromJson(json);

  Map<String, dynamic> toJson() => _$LogbookToJson(this);

  @override
  Iterable<Object?> get properties => [
        entityId,
        state,
        name,
        when,
        contextUserId,
        contextDomain,
        contextService,
        contextEventType,
      ];
}

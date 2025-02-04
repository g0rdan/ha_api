import 'package:ha_api/src/system/exact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'states_response.g.dart';

class HaStates implements Exact {
  const HaStates({
    required this.data,
  });
  final List<HaState>? data;

  factory HaStates.fromResponse(dynamic list) {
    return HaStates(
      data: (list as Iterable).map((e) => HaState.fromJson(e)).toList(),
    );
  }
  
  @override
  Iterable<Object?> get properties => data ?? [];
}

@JsonSerializable()
class HaState implements Exact {
  const HaState({
    required this.entityId,
    required this.state,
    required this.attributes,
    required this.lastChanged,
    required this.lastUpdated,
  });

  @JsonKey(name: 'entity_id')
  final String? entityId;

  @JsonKey(name: 'state')
  final String? state;

  @JsonKey(name: 'attributes')
  final Map<String, dynamic>? attributes;

  @JsonKey(name: 'last_changed')
  final DateTime? lastChanged;

  @JsonKey(name: 'last_updated')
  final DateTime? lastUpdated;

  factory HaState.fromJson(Map<String, dynamic> json) =>
      _$HaStateFromJson(json);

  Map<String, dynamic> toJson() => _$HaStateToJson(this);

  @override
  Iterable<Object?> get properties => [
        entityId,
        state,
        attributes,
        lastChanged,
        lastUpdated,
      ];
}

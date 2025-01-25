import 'package:ha/src/system/exact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'states_response.g.dart';

class StatesResponse {
  const StatesResponse({
    required this.data,
  });
  final List<State>? data;

  factory StatesResponse.fromResponse(dynamic list) {
    return StatesResponse(
      data: (list as Iterable).map((e) => State.fromJson(e)).toList(),
    );
  }
}

@JsonSerializable()
class State implements Exact {
  const State({
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

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  Map<String, dynamic> toJson() => _$StateToJson(this);

  @override
  Iterable<Object?> get properties => [
        entityId,
        state,
        attributes,
        lastChanged,
        lastUpdated,
      ];
}

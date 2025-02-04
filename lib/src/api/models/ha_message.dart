import 'package:ha_api/src/system/exact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_response.g.dart';

@JsonSerializable()
class HaMessage implements Exact {
  const HaMessage({required this.message});

  @JsonKey(name: 'message')
  final String message;

  factory HaMessage.fromJson(Map<String, dynamic> json) =>
      _$HaMessageFromJson(json);

  Map<String, dynamic> toJson() => _$HaMessageToJson(this);

  @override
  Iterable<Object?> get properties => [message];
}

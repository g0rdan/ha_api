
import 'package:ha/src/system/exact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ping_response.g.dart';

@JsonSerializable()
class PingResponse implements Exact {
  const PingResponse({
    required this.message,
  });

  final String message;

  bool get success => message == 'API running.';

  factory PingResponse.fromJson(Map<String, dynamic> json) =>
      _$PingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PingResponseToJson(this);
  
  @override
  Iterable<Object?> get properties => [
        message,
      ];
}

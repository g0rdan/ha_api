import 'package:ha/src/system/exact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'services_response.g.dart';

class ServicesResponse implements Exact {
  const ServicesResponse({
    this.data,
  });

  final List<Service>? data;

  factory ServicesResponse.fromResponse(dynamic list) {
    return ServicesResponse(
      data: (list as Iterable).map((e) => Service.fromJson(e)).toList(),
    );
  }

  @override
  Iterable<Object?> get properties => data ?? [];
}

@JsonSerializable()
class Service implements Exact {
  const Service({
    this.domain,
    this.services,
  });

  @JsonKey(name: 'domain')
  final String? domain;
  @JsonKey(name: 'services')
  final dynamic services;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);

  @override
  Iterable<Object?> get properties => [
        domain,
        ...?services,
      ];
}

import 'package:ha/src/system/exact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'services_response.g.dart';

class ServicesResponse implements Exact {
  const ServicesResponse({
    this.data,
  });

  final List<ServicesDomain>? data;

  factory ServicesResponse.fromResponse(dynamic list) {
    return ServicesResponse(
      data: (list as Iterable).map((e) => ServicesDomain.fromJson(e)).toList(),
    );
  }

  @override
  Iterable<Object?> get properties => data ?? [];
}

@JsonSerializable()
class ServicesDomain implements Exact {
  const ServicesDomain({
    this.domain,
    this.services,
  });

  @JsonKey(name: 'domain')
  final String? domain;
  @JsonKey(name: 'services')
  final Map<String, Service>? services;

  factory ServicesDomain.fromJson(Map<String, dynamic> json) =>
      _$ServicesDomainFromJson(json);

  Map<String, dynamic> toJson() => _$ServicesDomainToJson(this);

  @override
  Iterable<Object?> get properties => [
        domain,
        services,
      ];
}

@JsonSerializable()
class Service implements Exact {
  const Service({
    required this.name,
    required this.description,
    this.fields,
    this.target,
  });

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'fields')
  final Map<String, dynamic>? fields;

  @JsonKey(name: 'target')
  final Map<String, dynamic>? target;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);

  @override
  Iterable<Object?> get properties => [
        name,
        description,
        fields,
        target,
      ];
}

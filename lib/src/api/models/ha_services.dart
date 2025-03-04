import 'package:ha_api/src/system/exact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ha_services.g.dart';

class HaServices implements Exact {
  const HaServices({
    this.data,
  });

  final List<ServicesDomain>? data;

  factory HaServices.fromResponse(dynamic list) {
    return HaServices(
      data: (list as Iterable).map((e) => ServicesDomain.fromJson(e)).toList(),
    );
  }

  @override
  Iterable<Object?> get properties => data ?? [];
}

@JsonSerializable(createToJson: false)
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

  @override
  Iterable<Object?> get properties => [
        domain,
        services,
      ];
}

@JsonSerializable(createToJson: false)
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

  @override
  Iterable<Object?> get properties => [
        name,
        description,
        fields,
        target,
      ];
}

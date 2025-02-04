import 'package:ha_api/src/system/exact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_response.g.dart';

@JsonSerializable(explicitToJson: true)
class HaConfig implements Exact {
  @JsonKey(name: 'allowlist_external_dirs')
  final List<String>? allowlistExternalDirs;
  @JsonKey(name: 'allowlist_external_urls')
  final List<String>? allowlistExternalUrls;
  @JsonKey(name: 'components')
  final List<String>? components;
  @JsonKey(name: 'config_dir')
  final String? configDir;
  @JsonKey(name: 'config_source')
  final String? configSource;
  @JsonKey(name: 'country')
  final String? country;
  @JsonKey(name: 'currency')
  final String? currency;
  @JsonKey(name: 'debug')
  final bool? debug;
  @JsonKey(name: 'elevation')
  final int? elevation;
  @JsonKey(name: 'external_url')
  final String? externalUrl;
  @JsonKey(name: 'internal_url')
  final String? internalUrl;
  @JsonKey(name: 'language')
  final String? language;
  @JsonKey(name: 'latitude')
  final double? latitude;
  @JsonKey(name: 'location_name')
  final String? locationName;
  @JsonKey(name: 'longitude')
  final double? longitude;
  @JsonKey(name: 'radius')
  final int? radius;
  @JsonKey(name: 'recovery_mode')
  final bool? recoveryMode;
  @JsonKey(name: 'safe_mode')
  final bool safeMode;
  @JsonKey(name: 'state')
  final String? state;
  @JsonKey(name: 'time_zone')
  final String? timeZone;
  @JsonKey(name: 'unit_system')
  final UnitSystem? unitSystem;
  @JsonKey(name: 'version')
  final String? version;
  @JsonKey(name: 'whitelist_external_dirs')
  final List<String>? whitelistExternalDirs;

  const HaConfig({
    required this.allowlistExternalDirs,
    required this.allowlistExternalUrls,
    required this.components,
    required this.configDir,
    required this.configSource,
    required this.country,
    required this.currency,
    required this.debug,
    required this.elevation,
    required this.language,
    required this.latitude,
    required this.locationName,
    required this.longitude,
    required this.radius,
    required this.recoveryMode,
    required this.safeMode,
    required this.state,
    required this.timeZone,
    required this.unitSystem,
    required this.version,
    required this.whitelistExternalDirs,
    this.externalUrl,
    this.internalUrl,
  });

  factory HaConfig.fromJson(Map<String, dynamic> json) =>
      _$HaConfigFromJson(json);

  Map<String, dynamic> toJson() => _$HaConfigToJson(this);
  
  @override
  Iterable<Object?> get properties => [
        ...?allowlistExternalDirs,
        ...?allowlistExternalUrls,
        ...?components,
        configDir,
        configSource,
        country,
        currency,
        debug,
        elevation,
        externalUrl,
        internalUrl,
        language,
        latitude,
        locationName,
        longitude,
        radius,
        recoveryMode,
        safeMode,
        state,
        timeZone,
        unitSystem,
        version,
        ...?whitelistExternalDirs,
      ];
}

@JsonSerializable(explicitToJson: true)
class UnitSystem implements Exact {
  @JsonKey(name: 'length')
  final String? length;
  @JsonKey(name: 'accumulated_precipitation')
  final String? accumulatedPrecipitation;
  @JsonKey(name: 'area')
  final String? area;
  @JsonKey(name: 'mass')
  final String? mass;
  @JsonKey(name: 'pressure')
  final String? pressure;
  @JsonKey(name: 'temperature')
  final String? temperature;
  @JsonKey(name: 'volume')
  final String? volume;
  @JsonKey(name: 'wind_speed')
  final String? windSpeed;

  const UnitSystem({
    required this.length,
    required this.accumulatedPrecipitation,
    required this.area,
    required this.mass,
    required this.pressure,
    required this.temperature,
    required this.volume,
    required this.windSpeed,
  });

  factory UnitSystem.fromJson(Map<String, dynamic> json) =>
      _$UnitSystemFromJson(json);

  Map<String, dynamic> toJson() => _$UnitSystemToJson(this);
  
  @override
  Iterable<Object?> get properties => [
        length,
        accumulatedPrecipitation,
        area,
        mass,
        pressure,
        temperature,
        volume,
        windSpeed,
      ];
}

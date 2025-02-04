// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ha_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HaConfig _$HaConfigFromJson(Map<String, dynamic> json) => HaConfig(
      allowlistExternalDirs: (json['allowlist_external_dirs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      allowlistExternalUrls: (json['allowlist_external_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      components: (json['components'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      configDir: json['config_dir'] as String?,
      configSource: json['config_source'] as String?,
      country: json['country'] as String?,
      currency: json['currency'] as String?,
      debug: json['debug'] as bool?,
      elevation: (json['elevation'] as num?)?.toInt(),
      language: json['language'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      locationName: json['location_name'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      radius: (json['radius'] as num?)?.toInt(),
      recoveryMode: json['recovery_mode'] as bool?,
      safeMode: json['safe_mode'] as bool,
      state: json['state'] as String?,
      timeZone: json['time_zone'] as String?,
      unitSystem: json['unit_system'] == null
          ? null
          : UnitSystem.fromJson(json['unit_system'] as Map<String, dynamic>),
      version: json['version'] as String?,
      whitelistExternalDirs: (json['whitelist_external_dirs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      externalUrl: json['external_url'] as String?,
      internalUrl: json['internal_url'] as String?,
    );

Map<String, dynamic> _$HaConfigToJson(HaConfig instance) => <String, dynamic>{
      'allowlist_external_dirs': instance.allowlistExternalDirs,
      'allowlist_external_urls': instance.allowlistExternalUrls,
      'components': instance.components,
      'config_dir': instance.configDir,
      'config_source': instance.configSource,
      'country': instance.country,
      'currency': instance.currency,
      'debug': instance.debug,
      'elevation': instance.elevation,
      'external_url': instance.externalUrl,
      'internal_url': instance.internalUrl,
      'language': instance.language,
      'latitude': instance.latitude,
      'location_name': instance.locationName,
      'longitude': instance.longitude,
      'radius': instance.radius,
      'recovery_mode': instance.recoveryMode,
      'safe_mode': instance.safeMode,
      'state': instance.state,
      'time_zone': instance.timeZone,
      'unit_system': instance.unitSystem?.toJson(),
      'version': instance.version,
      'whitelist_external_dirs': instance.whitelistExternalDirs,
    };

UnitSystem _$UnitSystemFromJson(Map<String, dynamic> json) => UnitSystem(
      length: json['length'] as String?,
      accumulatedPrecipitation: json['accumulated_precipitation'] as String?,
      area: json['area'] as String?,
      mass: json['mass'] as String?,
      pressure: json['pressure'] as String?,
      temperature: json['temperature'] as String?,
      volume: json['volume'] as String?,
      windSpeed: json['wind_speed'] as String?,
    );

Map<String, dynamic> _$UnitSystemToJson(UnitSystem instance) =>
    <String, dynamic>{
      'length': instance.length,
      'accumulated_precipitation': instance.accumulatedPrecipitation,
      'area': instance.area,
      'mass': instance.mass,
      'pressure': instance.pressure,
      'temperature': instance.temperature,
      'volume': instance.volume,
      'wind_speed': instance.windSpeed,
    };

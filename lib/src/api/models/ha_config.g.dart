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
      safeMode: json['safe_mode'] as bool?,
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

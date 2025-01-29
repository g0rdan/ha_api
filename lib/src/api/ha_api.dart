import 'dart:convert';
import 'dart:typed_data';

import 'package:ha_api/src/api/models/export.dart';
import 'package:ha_api/src/http/http_client.dart';
import 'package:ha_api/src/system/service_locator.dart';

class HaApi {
  HaApi({
    required this.url,
    required String token,
  }) {
    _headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final locator = ServiceLocator.instance;
    locator.register<HttpClient>(HttpClient());
    _httpClient = locator.get<HttpClient>();
  }

  final String url;
  late final Map<String, String> _headers;
  late final HttpClient _httpClient;

  Future<PingResponse?> ping() async {
    const endpoint = '/api/';
    final response = await _httpClient.get(url + endpoint, _headers);
    return response.success
        ? PingResponse.fromJson(jsonDecode(response.dataStr))
        : null;
  }

  Future<ConfigResponse?> config() async {
    const endpoint = '/api/config';
    final response = await _httpClient.get(url + endpoint, _headers);
    return response.success
        ? ConfigResponse.fromJson(jsonDecode(response.dataStr))
        : null;
  }

  Future<EventsResponse?> events() async {
    const endpoint = '/api/events';
    final response = await _httpClient.get(url + endpoint, _headers);
    return response.success
        ? EventsResponse.fromResponse(jsonDecode(response.dataStr))
        : null;
  }

  Future<ServicesResponse?> services() async {
    const endpoint = '/api/services';
    final response = await _httpClient.get(url + endpoint, _headers);
    return response.success
        ? ServicesResponse.fromResponse(jsonDecode(response.dataStr))
        : null;
  }

  Future<StatesResponse?> states() async {
    const endpoint = '/api/states';
    final response = await _httpClient.get(url + endpoint, _headers);
    return response.success
        ? StatesResponse.fromResponse(jsonDecode(response.dataStr))
        : null;
  }

  Future<State?> state({
    required String entityId,
  }) async {
    final endpoint = '/api/states/$entityId';
    final response = await _httpClient.get(url + endpoint, _headers);
    return response.success
        ? State.fromJson(jsonDecode(response.dataStr))
        : null;
  }

  Future<String?> errorLog() async {
    const endpoint = '/api/error_log';
    final response = await _httpClient.get(url + endpoint, _headers);
    return response.success ? response.dataStr : null;
  }

  Future<CalendarsResponse?> calendars() async {
    const endpoint = '/api/calendars';
    final response = await _httpClient.get(url + endpoint, _headers);
    return response.success
        ? CalendarsResponse.fromResponse(jsonDecode(response.dataStr))
        : null;
  }

  Future<CalendarResponse?> calendar({
    required String entityId,
    required DateTime start,
    required DateTime end,
  }) async {
    final starIsoStr = start.toIso8601String();
    final endIsoStr = end.toIso8601String();
    final endpoint =
        '/api/calendars/$entityId?start=$starIsoStr&end=$endIsoStr';
    final response = await _httpClient.get(url + endpoint, _headers);
    return response.success
        ? CalendarResponse.fromResponse(jsonDecode(response.dataStr))
        : null;
  }

  Future<Uint8List?> cameraProxy({
    required String entityId,
    required String time,
  }) async {
    final endpoint = '/api/camera_proxy/$entityId?time=$time';
    final response = await _httpClient.get(url + endpoint, _headers);
    return response.success ? response.dataBytes : null;
  }

  Future<CheckConfigResponse?> checkConfig() async {
    const endpoint = '/api/config/core/check_config';
    final response = await _httpClient.post(url + endpoint, _headers, null);
    return response.success
        ? CheckConfigResponse.fromJson(jsonDecode(response.dataStr))
        : null;
  }
}

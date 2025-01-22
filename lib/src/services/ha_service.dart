import 'dart:convert';

import 'package:ha/src/clients/http_client.dart';
import 'package:ha/src/models/api/export.dart';
import 'package:ha/src/system/service_locator.dart';

class HaService {
  late final HttpClient _httpClient;
  late final String _url;
  late final Map<String, String> _headers;

  void init ({
    required String url,
    required String token,
  }) {
    _url = url;
    _headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final locator = ServiceLocator.instance;
    locator.register<HttpClient>(HttpClient());
    _httpClient = locator.get<HttpClient>();
  }

  Future<PingResponse?> ping() async {
    const endpoint = '/api/';
    final response = await _httpClient.get(_url + endpoint, _headers);
    return response != null
        ? PingResponse.fromJson(jsonDecode(response.body))
        : null;
  }

  Future<ConfigResponse?> config() async {
    const endpoint = '/api/config';
    final response = await _httpClient.get(_url + endpoint, _headers);
    return response != null
        ? ConfigResponse.fromJson(jsonDecode(response.body))
        : null;
  }

  Future<EventsResponse?> events() async {
    const endpoint = '/api/events';
    final response = await _httpClient.get(_url + endpoint, _headers);
    return response != null
        ? EventsResponse.fromResponse(jsonDecode(response.body))
        : null;
  }

  Future<ServicesResponse?> services() async {
    const endpoint = '/api/services';
    final response = await _httpClient.get(_url + endpoint, _headers);
    return response != null
        ? ServicesResponse.fromResponse(jsonDecode(response.body))
        : null;
  }
}

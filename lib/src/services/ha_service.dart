import 'dart:convert';

import 'package:ha/src/clients/http_client.dart';
import 'package:ha/src/models/api/ping_response.dart';
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
    final endpoint = '/api/';
    final response = await _httpClient.get(_url + endpoint, _headers);
    if (response != null) {
      return PingResponse.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<dynamic> config() async {
    final endpoint = '/api/config';
    return await _httpClient.get(_url + endpoint, _headers);
  }

  Future<dynamic> events() async {
    final endpoint = '/api/events';
    return await _httpClient.get(_url + endpoint, _headers);
  }
}

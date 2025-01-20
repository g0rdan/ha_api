import 'dart:developer';

import 'package:http/http.dart' as http;

class HttpClient {
  Future<http.Response?> get(
    String url,
    Map<String, String> headers,
  ) async {
    try {
      return await http.get(Uri.parse(url), headers: headers);
    } catch (e, st) {
      log('HA: HttpClient: GET Error: $e', stackTrace: st);
      rethrow;
    }
  }

  Future<http.Response?> post(
    String url,
    Map<String, String> headers,
    String body,
  ) async {
    try {
      return await http.post(Uri.parse(url), headers: headers, body: body);
    } catch (e, st) {
      log('HA: HttpClient: POST Error: $e', stackTrace: st);
      rethrow;
    }
  }
}

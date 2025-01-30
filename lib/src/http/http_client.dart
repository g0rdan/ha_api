import 'dart:developer';

import 'package:ha_api/src/http/models/http_response.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  Future<HttpResponse> get(
    String url,
    Map<String, String> headers,
  ) async {
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      return HttpResponse(response: response);
    } catch (e, st) {
      log('HA: HttpClient: GET Error: $e', stackTrace: st);
      rethrow;
    }
  }

  Future<HttpResponse> post(
    String url,
    Map<String, String> headers,
    String? body,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );
      return HttpResponse(response: response);
    } catch (e, st) {
      log('HA: HttpClient: POST Error: $e', stackTrace: st);
      rethrow;
    }
  }
}

import 'dart:typed_data';

import 'package:ha_api/src/system/exact.dart';
import 'package:http/http.dart';

class HttpResponse implements Exact {
  const HttpResponse({
    required Response response,
  }) : _response = response;

  final Response _response;

  /// Returns true if the status code is 2XX.
  bool get success => _response.statusCode >= 200 && _response.statusCode < 300;

  /// String representation of the response body.
  String get dataStr => _response.body;

  /// Byte representation of the response body.
  Uint8List get dataBytes => _response.bodyBytes;

  @override
  Iterable<Object?> get properties => [_response];
}

import 'dart:typed_data';

import 'package:ha_api/src/system/exact.dart';
import 'package:http/http.dart';

class HttpResponse implements Exact {
  const HttpResponse({
    required this.response,
  });

  final Response response;

  bool get success => response.statusCode == 200 && response.body.isNotEmpty;

  String get dataStr => response.body;

  Uint8List get dataBytes => response.bodyBytes;

  @override
  Iterable<Object?> get properties => [response];
}

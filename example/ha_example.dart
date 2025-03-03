import 'dart:io';

import 'package:ha_api/ha_api.dart';

void main() async {
  final url = Platform.environment['HA_API_URL']!;
  final token = Platform.environment['HA_API_TOKEN']!;

  final api = HaApi(
    url: url,
    token: token,
  )..init();

  final (pingResponse, failure) = await api.ping();
  print('ping message: ${pingResponse?.message}');
}

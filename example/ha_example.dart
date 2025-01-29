import 'package:ha_api/src/ha_api.dart';

void main() {
  final url = const String.fromEnvironment('URL');
  final token = const String.fromEnvironment('TOKEN');

  HaService()
    ..init(
      url: url,
      token: token,
    )
    ..ping();
}

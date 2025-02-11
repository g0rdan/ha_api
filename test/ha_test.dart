import 'package:ha_api/ha.dart';
import 'package:ha_api/src/http/http_client.dart';
import 'package:ha_api/src/http/models/http_response.dart';
import 'package:ha_api/src/system/service_locator.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'ha_test.mocks.dart';

const testURL = 'http://localhost:8123';
const testToken = 'secret';
const headers = {
  'Authorization': 'Bearer $testToken',
  'Content-Type': 'application/json',
};

@GenerateMocks([HttpClient])
void main() {
  final httpClient = MockHttpClient();
  final haApi = HaApi(url: testURL, token: testToken);

  setUp(() {
    ServiceLocator.instance.register<HttpClient>(httpClient);
  });

  group('Ping', () {
    test('Success', () async {
      when(httpClient.get('http://localhost:8123/api/', headers)).thenAnswer(
        (_) => Future.value(
          HttpResponse(
            response: Response('{"message": "API running."}', 200),
          ),
        ),
      );

      final (pingResponse, error) = await haApi.ping();

      expect(pingResponse?.message, 'API running.');
      expect(error, isNull);
    });

    test('Failure', () async {
      when(httpClient.get('http://localhost:8123/api/', headers)).thenAnswer(
        (_) => Future.value(HttpResponse(
          response: Response('{"message": "Error"}', 400),
        )),
      );

      final (pingResponse, error) = await haApi.ping();

      expect(pingResponse, isNull);
      expect(error?.message, isNotNull);
    });
  });
}



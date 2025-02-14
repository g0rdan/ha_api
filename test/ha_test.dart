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

  group('ping', () {
    test('ping - success', () async {
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

    test('ping - failure', () async {
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

  group('getConfig', () {
    test('getConfig - success', () async {
      when(httpClient.get('http://localhost:8123/api/config', headers))
          .thenAnswer(
        (_) => Future.value(
          HttpResponse(
            response: Response(
              '{"components": ["sensor.cpuspeed","frontend"],  "config_dir":"/home/ha/.homeassistant","elevation":510,"latitude":45.8781529,"location_name":"Home"}',
              200,
            ),
          ),
        ),
      );

      final (configResponse, error) = await haApi.getConfig();

      expect(configResponse?.components?.isNotEmpty, isTrue);
      expect(error, isNull);
    });

    test('getConfig - failure', () async {
      when(httpClient.get('http://localhost:8123/api/config', headers))
          .thenAnswer(
        (_) => Future.value(HttpResponse(
          response: Response('{"message": "Error"}', 400),
        )),
      );

      final (configResponse, error) = await haApi.getConfig();

      expect(configResponse, isNull);
      expect(error?.message, isNotNull);
    });
  });

  group('getEvents', () {
    test('getEvents - success', () async {
      when(httpClient.get('http://localhost:8123/api/events', headers))
          .thenAnswer(
        (_) => Future.value(
          HttpResponse(
            response: Response(
              '[{"event": "state_changed","listener_count": 5},{"event": "time_changed","listener_count": 2}]',
              200,
            ),
          ),
        ),
      );

      final (eventsResponse, error) = await haApi.getEvents();

      expect(eventsResponse?.data?.length, 2);
      expect(error, isNull);
    });

    test('getEvents - failure', () async {
      when(httpClient.get('http://localhost:8123/api/events', headers))
          .thenAnswer(
        (_) => Future.value(HttpResponse(
          response: Response('{"message": "Error"}', 400),
        )),
      );

      final (eventsResponse, error) = await haApi.getEvents();

      expect(eventsResponse, isNull);
      expect(error?.message, isNotNull);
    });
  });
}



import 'dart:typed_data';

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
      expect(pingResponse?.properties, ['API running.']);
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
      expect(error?.properties, ['{"message": "Error"}']);
    });
  });

  group('getConfig', () {
    test('getConfig - success', () async {
      when(httpClient.get('http://localhost:8123/api/config', headers))
          .thenAnswer(
        (_) => Future.value(
          HttpResponse(
            response: Response(
              '{"components": ["sensor.cpuspeed","frontend"],  "config_dir":"/home/ha/.homeassistant","elevation":510,"latitude":45.8781529,"location_name":"Home","unit_system":{"length":"km","mass":"kg","temperature":"C"}}',
              200,
            ),
          ),
        ),
      );

      final (config, error) = await haApi.getConfig();

      expect(config?.components?.isNotEmpty, isTrue);
      expect(config?.properties.first, 'sensor.cpuspeed');
      expect(config?.unitSystem?.mass, 'kg');
      expect(config?.unitSystem?.properties.where((p) => p != null).length, 3);
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

      final (events, error) = await haApi.getEvents();

      expect(events?.data?.length, 2);
      expect(events?.properties.length, 2);
      expect(events?.data?.first.properties.length, 2);
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

  group('getServices', () {
    test('getServices - success', () async {
      when(httpClient.get('http://localhost:8123/api/services', headers))
          .thenAnswer(
        (_) => Future.value(
          HttpResponse(
            response: Response(
              r'[{"domain": "browser"},{"domain": "keyboard"}]',
              200,
            ),
          ),
        ),
      );

      final (services, error) = await haApi.getServices();

      expect(services?.data?.length, 2);
      expect(services?.properties.length, 2);
      expect(error, isNull);
    });

    test('getServices - failure', () async {
      when(httpClient.get('http://localhost:8123/api/services', headers))
          .thenAnswer(
        (_) => Future.value(HttpResponse(
          response: Response('{"message": "Error"}', 400),
        )),
      );

      final (servicesResponse, error) = await haApi.getServices();

      expect(servicesResponse, isNull);
      expect(error?.message, isNotNull);
    });
  });

  group('getStates', () {
    test('getStates - success', () async {
      when(httpClient.get('http://localhost:8123/api/states', headers))
          .thenAnswer(
        (_) => Future.value(
          HttpResponse(
            response: Response(
              r'[{"entity_id": "1","state": "on"},{"entity_id": "2","state": "off"}]',
              200,
            ),
          ),
        ),
      );

      final (states, error) = await haApi.getStates();

      expect(states?.data?.length, 2);
      expect(states?.data?.last.state, "off");
      expect(states?.properties.length, 2);
      expect(error, isNull);
    });

    test('getStates - failure', () async {
      when(httpClient.get('http://localhost:8123/api/states', headers))
          .thenAnswer(
        (_) => Future.value(HttpResponse(
          response: Response('{"message": "Error"}', 400),
        )),
      );

      final (statesResponse, error) = await haApi.getStates();

      expect(statesResponse, isNull);
      expect(error?.message, isNotNull);
    });
  });

  group('getState', () {
    test('getState - success', () async {
      when(httpClient.get('http://localhost:8123/api/states/123', headers))
          .thenAnswer(
        (_) => Future.value(
          HttpResponse(
            response: Response(
              r'{"entity_id": "1","state": "on"}',
              200,
            ),
          ),
        ),
      );

      final (state, error) = await haApi.getState(entityId: '123');

      expect(state?.entityId, "1");
      expect(state?.state, "on");
      expect(state?.properties.where((p) => p != null).length, 2);
      expect(error, isNull);
    });

    test('getState - failure', () async {
      when(httpClient.get('http://localhost:8123/api/states/123', headers))
          .thenAnswer(
        (_) => Future.value(HttpResponse(
          response: Response('{"message": "Error"}', 400),
        )),
      );

      final (statesResponse, error) = await haApi.getState(entityId: '123');

      expect(statesResponse, isNull);
      expect(error?.message, isNotNull);
    });
  });

  group('getErrorLog', () {
    test('getErrorLog - success', () async {
      when(httpClient.get('http://localhost:8123/api/error_log', headers))
          .thenAnswer(
        (_) => Future.value(
          HttpResponse(
            response: Response(
              r'Line 1: Error\nLine 2: Error',
              200,
            ),
          ),
        ),
      );

      final (log, error) = await haApi.getErrorLog();

      expect(log?.isNotEmpty, isTrue);
      expect(error, isNull);
    });

    test('getErrorLog - failure', () async {
      when(httpClient.get('http://localhost:8123/api/error_log', headers))
          .thenAnswer(
        (_) => Future.value(HttpResponse(
          response: Response('{"message": "Error"}', 400),
        )),
      );

      final (errorLog, error) = await haApi.getErrorLog();

      expect(errorLog, isNull);
      expect(error?.message, isNotNull);
    });
  });

  group('getCalendars', () {
    test('getCalendars - success', () async {
      when(httpClient.get('http://localhost:8123/api/calendars', headers))
          .thenAnswer(
        (_) => Future.value(
          HttpResponse(
            response: Response(
              r'[{"entity_id": "1","name": "calendar 1"},{"entity_id": "2","name": "calendar 2"}]',
              200,
            ),
          ),
        ),
      );

      final (calendars, error) = await haApi.getCalendars();

      expect(calendars?.data?.length, 2);
      expect(calendars?.data?.first.name, "calendar 1");
      expect(calendars?.data?.first.properties.length, 2);
      expect(calendars?.properties.where((p) => p != null).length, 2);
      expect(error, isNull);
    });

    test('getCalendars - failure', () async {
      when(httpClient.get('http://localhost:8123/api/calendars', headers))
          .thenAnswer(
        (_) => Future.value(HttpResponse(
          response: Response('{"message": "Error"}', 400),
        )),
      );

      final (statesResponse, error) = await haApi.getCalendars();

      expect(statesResponse, isNull);
      expect(error?.message, isNotNull);
    });
  });

  group('getCalendar', () {
    test('getCalendar - success', () async {
      when(httpClient.get(
        'http://localhost:8123/api/calendars/123?start=2024-01-01T00:00:00.000&end=2025-01-01T00:00:00.000',
        headers,
      )).thenAnswer(
        (_) => Future.value(
          HttpResponse(
            response: Response(
              r'[{"summary": "summary","description": "description"}]',
              200,
            ),
          ),
        ),
      );

      final (calendar, error) = await haApi.getCalendar(
        entityId: '123',
        start: DateTime(2024),
        end: DateTime(2025),
      );

      expect(calendar?.data?.length, 1);
      expect(calendar?.data?.first.summary, "summary");
      expect(calendar?.data?.first.description, "description");
      expect(
        calendar?.data?.first.properties.where((p) => p != null).length,
        2,
      );
      expect(calendar?.properties.where((p) => p != null).length, 1);
      expect(error, isNull);
    });

    test('getCalendar - failure', () async {
      when(httpClient.get(
        'http://localhost:8123/api/calendars/123?start=2024-01-01T00:00:00.000&end=2025-01-01T00:00:00.000',
        headers,
      )).thenAnswer(
        (_) => Future.value(HttpResponse(
          response: Response('{"message": "Error"}', 400),
        )),
      );

      final (calendar, error) = await haApi.getCalendar(
        entityId: '123',
        start: DateTime(2024),
        end: DateTime(2025),
      );

      expect(calendar, isNull);
      expect(error?.message, isNotNull);
    });
  });

  group('getCameraProxy', () {
    test('getCameraProxy - success', () async {
      when(httpClient.get(
        'http://localhost:8123/api/camera_proxy/123?time=2024-01-01T00:00:00.000',
        headers,
      )).thenAnswer(
        (_) => Future.value(
          HttpResponse(
            response: Response.bytes(
              Uint8List.fromList([1, 2, 3]),
              200,
            ),
          ),
        ),
      );

      final (picture, error) = await haApi.getCameraProxy(
        entityId: '123',
        time: '2024-01-01T00:00:00.000',
      );

      expect(picture?.isNotEmpty, isTrue);
      expect(error, isNull);
    });

    test('getCameraProxy - failure', () async {
      when(httpClient.get(
        'http://localhost:8123/api/camera_proxy/123?time=2024-01-01T00:00:00.000',
        headers,
      )).thenAnswer(
        (_) => Future.value(HttpResponse(
          response: Response('{"message": "Error"}', 400),
        )),
      );

      final (picture, error) = await haApi.getCameraProxy(
        entityId: '123',
        time: '2024-01-01T00:00:00.000',
      );

      expect(picture, isNull);
      expect(error?.message, isNotNull);
    });
  });

  group('getHistory', () {
    test('getHistory - success', () async {
      when(httpClient.get(
        'http://localhost:8123/api/history/period/2024-01-01T00:00:00.000?filter_entity_id=123&end_time=2025-01-01T00:00:00.000',
        headers,
      )).thenAnswer(
        (_) => Future.value(
          HttpResponse(
            response: Response(
              r'[[{"entity_id": "1","state": "on"},{"entity_id": "2","state": "off"}]]',
              200,
            ),
          ),
        ),
      );

      final (history, error) = await haApi.getHistory(
        entityId: '123',
        startTime: DateTime(2024),
        endTime: DateTime(2025),
      );

      expect(history?.isNotEmpty, isTrue);
      expect(history?.last.entityId, '2');
      expect(history?.last.state, 'off');
      expect(history?.last.properties.where((p) => p != null).length, 2);
      expect(error, isNull);
    });

    test('getHistory - failure', () async {
      when(httpClient.get(
        'http://localhost:8123/api/history/period/2024-01-01T00:00:00.000?filter_entity_id=123&end_time=2025-01-01T00:00:00.000',
        headers,
      )).thenAnswer(
        (_) => Future.value(HttpResponse(
          response: Response('{"message": "Error"}', 400),
        )),
      );

      final (history, error) = await haApi.getHistory(
        entityId: '123',
        startTime: DateTime(2024),
        endTime: DateTime(2025),
      );

      expect(history, isNull);
      expect(error?.message, isNotNull);
    });
  });

  group('getLogbook', () {
    test('getLogbook - success', () async {
      when(httpClient.get(
        'http://localhost:8123/api/logbook/2024-01-01T00:00:00.000?end_time=2025-01-01T00:00:00.000&entity=123',
        headers,
      )).thenAnswer(
        (_) => Future.value(
          HttpResponse(
            response: Response(
              r'[{"entity_id": "1","state": "on"},{"entity_id": "2","state": "off"}]',
              200,
            ),
          ),
        ),
      );

      final (logbook, error) = await haApi.getLogbook(
        entityId: '123',
        startTime: DateTime(2024),
        endTime: DateTime(2025),
      );

      expect(logbook?.data?.length, 2);
      expect(logbook?.properties.length, 2);
      expect(logbook?.data?.first.properties.where((p) => p != null).length, 2);
      expect(error, isNull);
    });

    test('getLogbook - failure', () async {
      when(httpClient.get(
        'http://localhost:8123/api/logbook/2024-01-01T00:00:00.000?end_time=2025-01-01T00:00:00.000&entity=123',
        headers,
      )).thenAnswer(
        (_) => Future.value(HttpResponse(
          response: Response('{"message": "Error"}', 400),
        )),
      );

      final (history, error) = await haApi.getLogbook(
        entityId: '123',
        startTime: DateTime(2024),
        endTime: DateTime(2025),
      );

      expect(history, isNull);
      expect(error?.message, isNotNull);
    });
  });

  group('checkConfig', () {
    test('checkConfig - success', () async {
      when(httpClient.post(
        'http://localhost:8123/api/config/core/check_config',
        headers,
        null,
      )).thenAnswer(
        (_) => Future.value(
          HttpResponse(
            response: Response(
              r'{"result": "valid","errors": [],"warnings": []}',
              200,
            ),
          ),
        ),
      );

      final (config, error) = await haApi.checkConfig();

      expect(config?.result, "valid");
      expect(config?.properties.length, 3);
      expect(error, isNull);
    });

    test('checkConfig - failure', () async {
      when(httpClient.post(
        'http://localhost:8123/api/config/core/check_config',
        headers,
        null,
      )).thenAnswer(
        (_) => Future.value(HttpResponse(
          response: Response('{"message": "Error"}', 400),
        )),
      );

      final (config, error) = await haApi.checkConfig();

      expect(config, isNull);
      expect(error?.message, isNotNull);
    });
  });

  group('postState', () {
    test('postState - success', () async {
      when(httpClient.post(
        'http://localhost:8123/api/states/123',
        headers,
        '{"state":"on","attributes":null}',
      )).thenAnswer(
        (_) => Future.value(
          HttpResponse(
            response: Response(
              r'{"entity_id": "123","state": "on"}',
              200,
            ),
          ),
        ),
      );

      final (state, error) = await haApi.postState(
        entityId: '123',
        state: 'on',
      );

      expect(state?.entityId, "123");
      expect(state?.state, "on");
      expect(state?.properties.where((p) => p != null).length, 2);
      expect(error, isNull);
    });

    test('postState - failure', () async {
      when(httpClient.post(
        'http://localhost:8123/api/states/123',
        headers,
        '{"state":"on","attributes":null}',
      )).thenAnswer(
        (_) => Future.value(HttpResponse(
          response: Response('{"message": "Error"}', 400),
        )),
      );

      final (config, error) = await haApi.postState(
        entityId: '123',
        state: 'on',
      );

      expect(config, isNull);
      expect(error?.message, isNotNull);
    });
  });

  group('postEvent', () {
    test('postEvent - success', () async {
      when(httpClient.post(
        'http://localhost:8123/api/events/eventType',
        headers,
        'null',
      )).thenAnswer(
        (_) => Future.value(
          HttpResponse(
            response: Response(
              r'{"message": "Event is fired!"}',
              200,
            ),
          ),
        ),
      );

      final (event, error) = await haApi.postEvent(
        eventType: 'eventType',
      );

      expect(event?.message, "Event is fired!");
      expect(event?.properties, ["Event is fired!"]);
      expect(error, isNull);
    });

    test('postEvent - failure', () async {
      when(httpClient.post(
        'http://localhost:8123/api/events/eventType',
        headers,
        'null',
      )).thenAnswer(
        (_) => Future.value(HttpResponse(
          response: Response('{"message": "Error"}', 400),
        )),
      );

      final (event, error) = await haApi.postEvent(
        eventType: 'eventType',
      );

      expect(event, isNull);
      expect(error?.message, isNotNull);
    });
  });

  group('postService', () {
    test('postService - success', () async {
      when(httpClient.post(
        'http://localhost:8123/api/services/domain/service',
        headers,
        'null',
      )).thenAnswer(
        (_) => Future.value(
          HttpResponse(
            response: Response(
              r'[{"entity_id": "1","state": "on"},{"entity_id": "2","state": "off"}]',
              200,
            ),
          ),
        ),
      );

      final (services, error) = await haApi.postService(
        domain: 'domain',
        service: 'service',
      );

      expect(services?.data?.length, 2);
      expect(services?.properties.length, 2);
      expect(
          services?.data?.first.properties.where((p) => p != null).length, 2);
      expect(error, isNull);
    });

    test('postService - failure', () async {
      when(httpClient.post(
        'http://localhost:8123/api/services/domain/service',
        headers,
        'null',
      )).thenAnswer(
        (_) => Future.value(HttpResponse(
          response: Response('{"message": "Error"}', 400),
        )),
      );

      final (service, error) = await haApi.postService(
        domain: 'domain',
        service: 'service',
      );

      expect(service, isNull);
      expect(error?.message, isNotNull);
    });
  });

  group('postTemplate', () {
    test('postTemplate - success', () async {
      when(httpClient.post(
        'http://localhost:8123/api/template',
        headers,
        '{"template":"This is a template","variables":null}',
      )).thenAnswer(
        (_) => Future.value(
          HttpResponse(
            response: Response(
              r'This is a template',
              200,
            ),
          ),
        ),
      );

      final (template, error) = await haApi.postTemplate(
        template: 'This is a template',
      );

      expect(template, 'This is a template');
      expect(error, isNull);
    });

    test('postTemplate - failure', () async {
      when(httpClient.post(
        'http://localhost:8123/api/template',
        headers,
        '{"template":"This is a template","variables":null}',
      )).thenAnswer(
        (_) => Future.value(HttpResponse(
          response: Response('{"message": "Error"}', 400),
        )),
      );

      final (template, error) = await haApi.postTemplate(
        template: 'This is a template',
      );

      expect(template, isNull);
      expect(error?.message, isNotNull);
    });
  });

  group('postIntent', () {
    test('postIntent - success', () async {
      when(httpClient.post(
        'http://localhost:8123/api/intent/handle',
        headers,
        '{"name":"Intent name","data":null}',
      )).thenAnswer(
        (_) => Future.value(
          HttpResponse(
            response: Response(
              r'Intent name',
              200,
            ),
          ),
        ),
      );

      final (intent, error) = await haApi.postIntent(
        name: 'Intent name',
      );

      expect(intent, 'Intent name');
      expect(error, isNull);
    });

    test('postIntent - failure', () async {
      when(httpClient.post(
        'http://localhost:8123/api/intent/handle',
        headers,
        '{"name":"Intent name","data":null}',
      )).thenAnswer(
        (_) => Future.value(HttpResponse(
          response: Response('{"message": "Error"}', 400),
        )),
      );

      final (intent, error) = await haApi.postIntent(
        name: 'Intent name',
      );

      expect(intent, isNull);
      expect(error?.message, isNotNull);
    });
  });
}



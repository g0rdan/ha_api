import 'dart:convert';
import 'dart:typed_data';

import 'package:ha_api/src/api/models/export.dart';
import 'package:ha_api/src/http/http_client.dart';
import 'package:ha_api/src/system/service_locator.dart';

class HaApi {
  HaApi({
    required this.url,
    required String token,
  }) {
    _headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
  }

  final String url;
  late final Map<String, String> _headers;
  final sl = ServiceLocator.instance;

  void init() {
    sl.register<HttpClient>(HttpClient());
  }

  /// Returns a message if the API is up and running.
  Future<(HaMessage?, HaFailure?)> ping() async {
    const endpoint = '/api/';
    final response = await sl.get<HttpClient>().get(url + endpoint, _headers);
    return response.success
        ? (HaMessage.fromJson(jsonDecode(response.dataStr)), null)
        : (null, HaFailure(message: response.dataStr));
  }

  /// Returns the current configuration as JSON.
  Future<(HaConfig?, HaFailure?)> getConfig() async {
    const endpoint = '/api/config';
    final response = await sl.get<HttpClient>().get(url + endpoint, _headers);
    return response.success
        ? (HaConfig.fromJson(jsonDecode(response.dataStr)), null)
        : (null, HaFailure(message: response.dataStr));
  }

  /// Returns an array of event objects. Each event object contains event name
  /// and listener count.
  Future<(HaEvents?, HaFailure?)> getEvents() async {
    const endpoint = '/api/events';
    final response = await sl.get<HttpClient>().get(url + endpoint, _headers);
    return response.success
        ? (HaEvents.fromResponse(jsonDecode(response.dataStr)), null)
        : (null, HaFailure(message: response.dataStr));
  }

  /// Returns an array of service objects. Each object contains the domain and
  /// which services it contains.
  Future<(HaServices?, HaFailure?)> getServices() async {
    const endpoint = '/api/services';
    final response = await sl.get<HttpClient>().get(url + endpoint, _headers);
    return response.success
        ? (HaServices.fromResponse(jsonDecode(response.dataStr)), null)
        : (null, HaFailure(message: response.dataStr));
  }

  /// Returns an array of state objects. Each state has the following
  /// attributes: entity_id, state, last_changed and attributes.
  Future<(HaStates?, HaFailure?)> getStates() async {
    const endpoint = '/api/states';
    final response = await sl.get<HttpClient>().get(url + endpoint, _headers);
    return response.success
        ? (HaStates.fromResponse(jsonDecode(response.dataStr)), null)
        : (null, HaFailure(message: response.dataStr));
  }

  /// Returns a state object for specified entity_id. Returns 404 if not found.
  Future<(HaState?, HaFailure?)> getState({
    required String entityId,
  }) async {
    final endpoint = '/api/states/$entityId';
    final response = await sl.get<HttpClient>().get(url + endpoint, _headers);
    return response.success
        ? (HaState.fromJson(jsonDecode(response.dataStr)), null)
        : (null, HaFailure(message: response.dataStr));
  }

  /// Retrieve all errors logged during the current session of Home Assistant
  /// as a plaintext response.
  Future<(String?, HaFailure?)> getErrorLog() async {
    const endpoint = '/api/error_log';
    final response = await sl.get<HttpClient>().get(url + endpoint, _headers);
    return response.success
        ? (response.dataStr, null)
        : (null, HaFailure(message: response.dataStr));
  }

  /// Returns the list of calendar entities.
  Future<(HaCalendars?, HaFailure?)> getCalendars() async {
    const endpoint = '/api/calendars';
    final response = await sl.get<HttpClient>().get(url + endpoint, _headers);
    return response.success
        ? (HaCalendars.fromResponse(jsonDecode(response.dataStr)), null)
        : (null, HaFailure(message: response.dataStr));
  }

  /// Returns the list of calendar events for the specified calendar entity_id
  /// between the start and end times (exclusive).
  ///
  /// The events in the response have a start and end that contain either
  /// dateTime or date for an all day event.
  Future<(HaCalendar?, HaFailure?)> getCalendar({
    required String entityId,
    required DateTime start,
    required DateTime end,
  }) async {
    final starIsoStr = start.toIso8601String();
    final endIsoStr = end.toIso8601String();
    final endpoint =
        '/api/calendars/$entityId?start=$starIsoStr&end=$endIsoStr';
    final response = await sl.get<HttpClient>().get(url + endpoint, _headers);
    return response.success
        ? (HaCalendar.fromResponse(jsonDecode(response.dataStr)), null)
        : (null, HaFailure(message: response.dataStr));
  }

  /// Returns the data (image) from the specified camera entity_id.
  Future<(Uint8List?, HaFailure?)> getCameraProxy({
    required String entityId,
    required String time,
  }) async {
    final endpoint = '/api/camera_proxy/$entityId?time=$time';
    final response = await sl.get<HttpClient>().get(url + endpoint, _headers);
    return response.success
        ? (response.dataBytes, null)
        : (null, HaFailure(message: response.dataStr));
  }

  Future<(List<HaState>?, HaFailure?)> getHistory({
    required String entityId,
    DateTime? startTime,
    DateTime? endTime,
  }) async {
    final startTimeStr = startTime?.toIso8601String();
    final params = {
      'filter_entity_id': entityId,
    };
    if (endTime != null) params['end_time'] = endTime.toIso8601String();
    final endpoint =
        '/api/history/period${startTimeStr != null ? '/$startTimeStr' : ''}'
        '${_formUrlParameters(params)}';
    final response = await sl.get<HttpClient>().get(url + endpoint, _headers);
    if (response.success) {
      final states = <HaState>[];
      final list = (jsonDecode(response.dataStr) as List?);
      for (var innerList in list ?? []) {
        for (var stateJson in innerList ?? []) {
          states.add(HaState.fromJson(stateJson));
        }
      }
      return (states, null);
    } else {
      return (null, HaFailure(message: response.dataStr));
    }
  }

  Future<(HaLogbook?, HaFailure?)> getLogbook({
    String? entityId,
    DateTime? startTime,
    DateTime? endTime,
  }) async {
    final startTimeStr = startTime?.toIso8601String();
    final params = <String, String>{};
    if (endTime != null) params['end_time'] = endTime.toIso8601String();
    if (entityId != null) params['entity'] = entityId;
    final endpoint =
        '/api/logbook${startTimeStr != null ? '/$startTimeStr' : ''}'
        '${_formUrlParameters(params)}';
    final endpointEncoded = Uri.encodeFull(url + endpoint);
    final response = await sl.get<HttpClient>().get(endpointEncoded, _headers);
    return response.success
        ? (HaLogbook.fromResponse(jsonDecode(response.dataStr)), null)
        : (null, HaFailure(message: response.dataStr));
  }

  /// Trigger a check of configuration.yaml.
  ///
  /// No additional data needs to be passed in with this request.
  /// Needs config integration enabled.
  Future<(HaCheckConfig?, HaFailure?)> checkConfig() async {
    const endpoint = '/api/config/core/check_config';
    final response =
        await sl.get<HttpClient>().post(url + endpoint, _headers, null);
    return response.success
        ? (HaCheckConfig.fromJson(jsonDecode(response.dataStr)), null)
        : (null, HaFailure(message: response.dataStr));
  }

  /// Updates or creates a state. You can create any state that you want,
  /// it does not have to be backed by an entity in Home Assistant.
  ///
  /// This endpoint sets the representation of a device within Home Assistant
  /// and will not communicate with the actual device.
  /// To communicate with the device, use [postService].
  ///
  /// The return code is 200 if the entity existed, 201 if the state of a new
  /// entity was set. A location header will be returned with the URL of
  /// the new resource. The response body will contain a JSON encoded
  /// State object.
  Future<(HaState?, HaFailure?)> postState({
    required String entityId,
    required String state,
    Map<String, dynamic>? attributes,
  }) async {
    final endpoint = '/api/states/$entityId';
    final data = jsonEncode({
      'state': state,
      'attributes': attributes,
    });
    final response =
        await sl.get<HttpClient>().post(url + endpoint, _headers, data);
    return response.success
        ? (HaState.fromJson(jsonDecode(response.dataStr)), null)
        : (null, HaFailure(message: response.dataStr));
  }

  /// Fires an event with event_type.
  ///
  /// Please be mindful of the data structure as documented on our [Data Science portal](https://data.home-assistant.io/docs/events/#database-table).
  /// You can pass an optional JSON object to be used as event_data.
  /// Returns a message if successful.
  Future<(HaMessage?, HaFailure?)> postEvent({
    required String eventType,
    Map<String, dynamic>? eventData,
  }) async {
    final endpoint = '/api/events/$eventType';
    final data = jsonEncode(eventData);
    final response =
        await sl.get<HttpClient>().post(url + endpoint, _headers, data);
    return response.success
        ? (HaMessage.fromJson(jsonDecode(response.dataStr)), null)
        : (null, HaFailure(message: response.dataStr));
  }

  /// Calls a service within a specific domain.
  ///
  /// Will return when the service has been executed. You can pass an optional
  /// JSON object to be used as service_data. Returns a list of states that
  /// have changed while the service was being executed.
  Future<(HaStates?, HaFailure?)> postService({
    required String domain,
    required String service,
    Map<String, dynamic>? serviceData,
  }) async {
    final endpoint = '/api/services/$domain/$service';
    final data = jsonEncode(serviceData);
    final response =
        await sl.get<HttpClient>().post(url + endpoint, _headers, data);
    return response.success
        ? (HaStates.fromResponse(jsonDecode(response.dataStr)), null)
        : (null, HaFailure(message: response.dataStr));
  }

  /// Render a Home Assistant template.
  ///
  /// See [template docs](https://www.home-assistant.io/docs/configuration/templating) for more information.
  /// Returns the rendered template in plain text.
  Future<(String?, HaFailure?)> postTemplate({
    required String template,
    Map<String, dynamic>? variables,
  }) async {
    final endpoint = '/api/template';
    final data = jsonEncode({
      'template': template,
      'variables': variables,
    });
    final response =
        await sl.get<HttpClient>().post(url + endpoint, _headers, data);
    return response.success
        ? (response.dataStr, null)
        : (null, HaFailure(message: response.dataStr));
  }

  /// Handle an intent.
  ///
  /// You must add `intent:` to your configuration.yaml to enable this endpoint.
  Future<(String?, HaFailure?)> postIntent({
    required String name,
    Map<String, dynamic>? variables,
  }) async {
    final endpoint = '/api/intent/handle';
    final data = jsonEncode({
      "name": name,
      "data": variables,
    });
    final response =
        await sl.get<HttpClient>().post(url + endpoint, _headers, data);
    return response.success
        ? (response.dataStr, null)
        : (null, HaFailure(message: response.dataStr));
  }

  String _formUrlParameters(Map<String, String> parameters) {
    if (parameters.isEmpty) {
      return '';
    }
    final params = parameters.entries.map((e) {
      return '${e.key}=${e.value}';
    });
    return '?${params.join('&')}';
  }
}

# Home Assistant API client for Dart

An API client for [Home Assistant](https://www.home-assistant.io) automation framework.
If you ever wanted to control your home from your Dart application, this is the package for you.
The client covers following Home Assistant APIs:

GET

- `/api/`
- `/api/config`
- `/api/events`
- `/api/services`
- `/api/history/period/<timestamp>`
- `/api/logbook/<timestamp>`
- `/api/states`
- `/api/states/<entity_id>`
- `/api/error_log`
- `/api/camera_proxy/<camera entity_id>`
- `/api/calendars`
- `/api/calendars/<calendar entity_id>`

POST

- `/api/states/<entity_id>`
- `/api/events/<event_type>`
- `/api/services/<domain>/<service>`
- `/api/template`
- `/api/config/core/check_config`
- `/api/intent/handle`

More documentation can be found [here](https://developers.home-assistant.io/docs/api/rest/).


## Usage

To add this package as a dependency, add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  ha_api: ^0.1.0
```

## Examples

Here are small examples that show you how to use the API.

### Get the state of an entity

```dart
import 'package:ha_api/ha_api.dart';

void main() async {
  final haClient = HaApi(
    url: 'yourIpAndPort',
    token: 'yourBearerToken',
  // make sure you call init() before using the client
  )..init();

  final (services, failure) = await service.getServices();
}

```

If the request was successful, the `services` variable will contain the result. If the request failed, the `failure` variable will contain the error.

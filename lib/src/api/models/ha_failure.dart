import 'package:ha_api/src/system/exact.dart';

class HaFailure implements Exact {
  const HaFailure({
    required this.message,
  });

  final String message;

  @override
  Iterable<Object?> get properties => [
        message,
      ];
}

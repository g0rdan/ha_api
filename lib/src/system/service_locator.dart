class ServiceLocator {
  // Private constructor to prevent direct instantiation
  ServiceLocator._();

  // Singleton instance
  static final ServiceLocator instance = ServiceLocator._();

  // Storage for services
  final _services = <Type, dynamic>{};

  // Register a service
  void register<T>(T service) {
    if (service == null) {
      throw ArgumentError('Service cannot be null');
    }
    _services[T] = service;
  }

  // Register a singleton lazily
  void registerLazySingleton<T>(T Function() factory) {
    _services[T] = _LazyService(factory);
  }

  // Get a service
  T get<T>() {
    final service = _services[T];

    if (service == null) {
      throw StateError('Service $T not found');
    }

    // Handle lazy initialization
    if (service is _LazyService) {
      final actualService = service.factory();
      _services[T] = actualService;
      return actualService as T;
    }

    return service as T;
  }

  // Check if a service is registered
  bool isRegistered<T>() => _services.containsKey(T);

  // Reset all services (useful for testing)
  void reset() => _services.clear();

  // Unregister a specific service
  void unregister<T>() => _services.remove(T);
}

// Helper class for lazy initialization
class _LazyService {
  final Function factory;

  _LazyService(this.factory);
}

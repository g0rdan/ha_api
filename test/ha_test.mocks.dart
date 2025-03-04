// Mocks generated by Mockito 5.4.5 from annotations
// in ha_api/test/ha_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:ha_api/src/http/http_client.dart' as _i3;
import 'package:ha_api/src/http/models/http_response.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeHttpResponse_0 extends _i1.SmartFake implements _i2.HttpResponse {
  _FakeHttpResponse_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [HttpClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i3.HttpClient {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.HttpResponse> get(String? url, Map<String, String>? headers) =>
      (super.noSuchMethod(
        Invocation.method(#get, [url, headers]),
        returnValue: _i4.Future<_i2.HttpResponse>.value(
          _FakeHttpResponse_0(
            this,
            Invocation.method(#get, [url, headers]),
          ),
        ),
      ) as _i4.Future<_i2.HttpResponse>);

  @override
  _i4.Future<_i2.HttpResponse> post(
    String? url,
    Map<String, String>? headers,
    String? body,
  ) =>
      (super.noSuchMethod(
        Invocation.method(#post, [url, headers, body]),
        returnValue: _i4.Future<_i2.HttpResponse>.value(
          _FakeHttpResponse_0(
            this,
            Invocation.method(#post, [url, headers, body]),
          ),
        ),
      ) as _i4.Future<_i2.HttpResponse>);
}

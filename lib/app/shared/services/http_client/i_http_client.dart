import 'dart:typed_data';

import 'typedefs.dart';

abstract class IHttpClient {
  AsyncResponse get(
    String url, {
    dynamic data,
    HttpHeadersAnotattion headers = const {},
    Map<String, String> params = const {},
  });

  AsyncResponse delete(
    String url, {
    dynamic data,
    HttpHeadersAnotattion headers = const {},
  });

  AsyncResponse post(
    String url, {
    dynamic data,
    HttpHeadersAnotattion headers = const {},
  });

  AsyncResponse postFormData(
    String url, {
    required String filePath,
    required String type,
    required String subtype,
    Uint8List? bytes,
    Map<String, dynamic>? data,
    String field = 'file',
    String method = 'post',
    String? filename,
    HttpHeadersAnotattion headers = const {},
  });

  AsyncResponse put(
    String url, {
    dynamic data,
    HttpHeadersAnotattion headers = const {},
  });

  AsyncResponse patch(
    String url, {
    dynamic data,
    HttpHeadersAnotattion headers = const {},
  });
}

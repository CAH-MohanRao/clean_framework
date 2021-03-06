import 'dart:async';

import 'package:clean_framework/clean_framework.dart';
import 'package:http/http.dart';

import 'http_client/cross_client.dart'
    if (dart.library.io) 'http_client/io_client.dart';

class SimpleRestApi extends RestApi {
  final String baseUrl;
  final bool trustSelfSigned;

  Client _httpClient;

  SimpleRestApi({
    this.baseUrl = 'http://127.0.0.1:8080/service/',
    this.trustSelfSigned = false,
  }) : _httpClient = createHttpClient(trustSelfSigned);

  @override
  Future<RestResponse> request({
    RestMethod method,
    String path,
    Map<String, dynamic> requestBody = const {},
  }) async {
    assert(method != null && path != null && path.isNotEmpty);

    Response response;
    Uri uri = Uri.parse(baseUrl + path);

    try {
      switch (method) {
        case RestMethod.get:
          response = await _httpClient.get(uri);
          break;
        case RestMethod.post:
          response = await _httpClient.post(uri, body: requestBody);
          break;
        case RestMethod.put:
          response = await _httpClient.put(uri, body: requestBody);
          break;
        case RestMethod.delete:
          response = await _httpClient.delete(uri);
          break;
        case RestMethod.patch:
          response = await _httpClient.patch(uri, body: requestBody);
          break;
      }

      return RestResponse<String>(
        type: RestResponseType.success,
        uri: uri,
        content: response.body,
      );
    } on ClientException {
      return RestResponse<String>(
        type: getResponseTypeFromCode(response?.statusCode),
        uri: uri,
        content: response?.body ?? '',
      );
    } catch (e) {
      return RestResponse<String>(
        type: RestResponseType.unknown,
        uri: uri,
        content: '',
      );
    }
  }
}

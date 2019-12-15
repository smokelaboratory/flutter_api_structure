import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiConnector {
  Dio _dio;
  String tag = "API call :";
  CancelToken _cancelToken;

  ApiConnector() {
    _dio = createDio();
  }

  Dio createDio() {
    _cancelToken = CancelToken();
    return Dio(BaseOptions(
        connectTimeout: 10 * 1000,
        receiveTimeout: 10 * 1000,
        baseUrl: "https://jsonplaceholder.typicode.com",
        contentType: 'application/json',
        headers: {
          'Authorization': 'Bearer ',
        }))
      ..interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        debugPrint("$tag ${options.toString()}", wrapWidth: 1024);
        return options;
      }, onResponse: (Response response) async {
        debugPrint("$tag  ${response.toString()}", wrapWidth: 1024);
        return response;
      }, onError: (DioError e) async {
        debugPrint("$tag ${e.toString()}", wrapWidth: 1024);
        return e;
      }));
  }

  void cancelRequests({CancelToken cancelToken}) {
    cancelToken == null
        ? _cancelToken.cancel('Cancelled')
        : cancelToken.cancel();
  }

  Future<Response> get(
    String endUrl, {
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    return await (_dio.get(
      endUrl,
      queryParameters: params,
      cancelToken: cancelToken ?? _cancelToken,
      options: options,
    )).catchError((e) {
      throw e;
    });
  }
}

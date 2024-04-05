import 'package:comp/core/services/network/network_consts.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  final Dio _dio;
  final Interceptor _prettyDioLogger;

  ApiClient(this._dio, this._prettyDioLogger) {
    final BaseOptions baseOptions = BaseOptions(
      baseUrl: NetworkConsts.baseUrl,
      receiveDataWhenStatusError: true,
    );
    _dio.options = baseOptions;
    if (kDebugMode) _dio.interceptors.add(_prettyDioLogger);
  }

  Future<Response> post({
    required String url,
    required String baseUrl,
    var requestBody,
    Map<String, dynamic>? queryParameters,
  }) async {
    final BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );
    final Dio dioWithBaseUrl = Dio(options);

    return await dioWithBaseUrl.post(
      url,
      queryParameters: queryParameters,
      data: requestBody,
      options: Options(contentType: 'multipart/form-data'),
    );
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(),
    );
  }
}

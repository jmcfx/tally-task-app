import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;

class DioClient {
  final Dio dio;
  DioClient({String baseUrl = "https://local.api"})
    : dio = Dio(BaseOptions(baseUrl: baseUrl)) {
    dio.interceptors.add(_LocalAssetInterceptor());

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}

class _LocalAssetInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.path.endsWith("/businesses")) {
      try {
        final jsonStr = await rootBundle.loadString(
          'assets/data/businesses.json',
        );
        final data = jsonDecode(jsonStr);
        handler.resolve(
          Response(requestOptions: options, statusCode: 200, data: data),
        );
        return;
      } catch (e) {
        handler.reject(DioException(requestOptions: options, error: e));
        return;
      }
    }
    handler.next(options);
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;
import 'package:jmc_test/app/data/response/default/response_standard.dart';

class Callback extends Interceptor {
  Callback(
    this.dio,
    this.baseUrl,
    this.isAuth, {
    this.params,
    this.data,
  });

  final String? baseUrl;
  final Dio dio;
  final Map<String, dynamic>? params;
  final dynamic data;
  final bool isAuth;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      printInfo(info: options.uri.toString());
      printInfo(
        info: 'REQUEST[${options.method}: ${options.path}]'
            ' => Param: ${options.queryParameters}'
            ' => EXTRA: ${options.extra.toString()}'
            ' => DATA: ${options.data}'
            ' => Header: ${options.headers.toString()}',
      );
    }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      printInfo(
        info: 'RESPONSE[${response.statusCode}: ${response.requestOptions.path}]'
            ' => DATA: ${response.data.toString()}',
      );
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == null) {
      if (kDebugMode) {
        printInfo(
          info: 'ERROR null [${err.type.name}: ${err.requestOptions.path.toString()}]'
              ' => MSG: ${err.message}',
        );
      }
      super.onError(
        DioException(
          error: 'Network Unavailable',
          response: Response(
            requestOptions: err.requestOptions,
            data: ResponseStandard(
              data: null,
              dataCount: 0,
              page: 1,
              totalData: 0,
              totalPage: 0,
            ).toJson(),
            statusCode: 500,
          ),
          requestOptions: err.requestOptions,
        ),
        handler,
      );
    } else {
      if (kDebugMode) {
        printInfo(
          info: 'ERROR[${err.response?.statusCode}: ${err.requestOptions.path}]'
              ' => DATA: ${err.response?.data}',
        );
      }

      if (err.response?.data is Map) {
        super.onError(err, handler);
      } else {
        super.onError(
          DioException(
            error: 'Server Unavailable',
            response: Response(
              requestOptions: err.requestOptions,
              data: ResponseStandard(
                data: null,
                dataCount: 0,
                page: 1,
                totalData: 0,
                totalPage: 0,
              ).toJson(),
              statusCode: 500,
            ),
            requestOptions: err.requestOptions,
          ),
          handler,
        );
      }
    }
  }
}

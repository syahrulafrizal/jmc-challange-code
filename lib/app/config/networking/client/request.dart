import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;
import 'package:jmc_test/app/config/networking/client/callback.dart';
import '../../../data/response/default/response_standard.dart';

enum REQUEST_METHOD {
  POST,
  GET,
  DELETE,
  PUT,
  PATCH,
  DOWNLOAD,
}

class Request {
  final Dio dio = Dio();

  Future<Response> clientRequest({
    required String pathUrl,
    required REQUEST_METHOD requestMethod,
    Map<String, dynamic>? params,
    dynamic data,
    String? path,
    bool isAuth = true,
    String? pathSaved,
    ResponseType responseType = ResponseType.json,
  }) async {
    try {
      String baseUrl = "https://jmcindonesia.com/";

      dio.options.baseUrl = baseUrl;
      dio.options.responseType = ResponseType.json;
      dio.options.headers['content-Type'] = 'application/vnd.api+json';
      dio.options.headers['Accept'] = 'application/json';

      dio.options.connectTimeout = const Duration(minutes: 5);
      dio.options.sendTimeout = const Duration(minutes: 5);
      dio.options.receiveTimeout = const Duration(minutes: 5);
      dio.interceptors.clear();
      dio.interceptors.add(Callback(dio, baseUrl, isAuth, params: params));

      switch (requestMethod) {
        case REQUEST_METHOD.GET:
          return await dio.get(
            pathUrl + (path != null ? '/$path' : ''),
            queryParameters: params,
          );

        case REQUEST_METHOD.POST:
          return data != null
              ? await dio.post(
                  pathUrl + (path != null ? '/$path' : ''),
                  data: data,
                  queryParameters: params,
                )
              : await dio.post(
                  pathUrl + (path != null ? '/$path' : ''),
                  queryParameters: params,
                );

        case REQUEST_METHOD.PUT:
          return data != null
              ? await dio.put(
                  pathUrl + (path != null ? '/$path' : ''),
                  data: data,
                  queryParameters: params,
                )
              : await dio.put(
                  pathUrl + (path != null ? '/$path' : ''),
                  queryParameters: params,
                );

        case REQUEST_METHOD.DELETE:
          return data != null
              ? await dio.delete(
                  pathUrl + (path != null ? '/$path' : ''),
                  data: data,
                  queryParameters: params,
                )
              : await dio.delete(
                  pathUrl + (path != null ? '/$path' : ''),
                  queryParameters: params,
                );

        case REQUEST_METHOD.PATCH:
          return data != null
              ? await dio.patch(
                  pathUrl + (path != null ? '/$path' : ''),
                  data: data,
                  queryParameters: params,
                )
              : await dio.patch(
                  pathUrl + (path != null ? '/$path' : ''),
                  queryParameters: params,
                );

        case REQUEST_METHOD.DOWNLOAD:
          return await dio.download(
            pathUrl,
            pathSaved,
            onReceiveProgress: (rcv, total) {
              if (kDebugMode) {
                printInfo(
                  info: 'received: ${rcv.toStringAsFixed(0)} out of total: ${total.toStringAsFixed(0)}',
                );
              }
            },
          );

        default:
          return Response(
            requestOptions: RequestOptions(),
            data: ResponseStandard(
              data: null,
              dataCount: 0,
              page: 1,
              totalData: 0,
              totalPage: 0,
            ).toJson(),
            statusCode: 500,
          );
      }
    } on DioException catch (e) {
      return e.response!;
    }
  }
}

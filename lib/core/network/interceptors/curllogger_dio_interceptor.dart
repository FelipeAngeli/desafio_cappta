import 'dart:convert';

import 'package:dio/dio.dart';

import '../../utils/print_debug_colored_utils.dart';

class CurlLoggerDioInterceptor extends Interceptor {
  final int instanceNumber;
  final String clientName;

  CurlLoggerDioInterceptor(this.instanceNumber, this.clientName);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final curl = StringBuffer(
        'instance n:$instanceNumber  clientName: $clientName curl -X ${options.method} \'${options.uri.toString()}\'');

    options.headers.forEach((k, v) {
      curl.write(' -H "$k: $v"');
    });

    if (options.data != null) {
      if (options.data is FormData) {
        final formData = options.data as FormData;
        for (var field in formData.fields) {
          curl.write(' -F "${field.key}=${field.value}"');
        }
        for (var file in formData.files) {
          curl.write(' -F "${file.key}=@${file.value.filename}"');
        }
      } else if (options.data is Map) {
        curl.write(' -d \'${jsonEncode(options.data)}\'');
      } else {
        curl.write(' -d \'${options.data.toString()}\'');
      }
    }

    PrintDebugColoredUtils.printWhite(curl.toString());

    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    PrintDebugColoredUtils.printGreen(response.toString());
    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    PrintDebugColoredUtils.printError(err.toString());
    handler.next(err);
  }
}

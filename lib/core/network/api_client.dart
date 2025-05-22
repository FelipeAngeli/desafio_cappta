import 'package:dio/dio.dart';
import 'api_exception.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}

import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;

  ApiException(this.message);

  factory ApiException.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException("Tempo de conexão esgotado");
      case DioExceptionType.sendTimeout:
        return ApiException("Tempo de envio esgotado");
      case DioExceptionType.receiveTimeout:
        return ApiException("Tempo de resposta esgotado");
      case DioExceptionType.badResponse:
        return ApiException(
            "Erro de resposta: ${dioError.response?.statusCode}");
      case DioExceptionType.cancel:
        return ApiException("Requisição cancelada");
      case DioExceptionType.unknown:
      default:
        return ApiException("Erro desconhecido: ${dioError.message}");
    }
  }

  @override
  String toString() => message;
}

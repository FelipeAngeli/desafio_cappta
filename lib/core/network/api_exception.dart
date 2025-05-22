import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  @override
  String toString() => message;

  factory ApiException.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException("Tempo de conexão esgotado");
      case DioExceptionType.sendTimeout:
        return ApiException("Tempo de envio esgotado");
      case DioExceptionType.receiveTimeout:
        return ApiException("Tempo de resposta esgotado");
      case DioExceptionType.badResponse:
        return ApiException("Erro de resposta: ${error.response?.statusCode}");
      case DioExceptionType.cancel:
        return ApiException("Requisição cancelada");
      case DioExceptionType.unknown:
      default:
        return ApiException("Erro desconhecido: ${error.message}");
    }
  }
}

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:desafio_cappta/core/network/api_client.dart';
import 'package:desafio_cappta/core/network/api_exception.dart';

void main() {
  late ApiClient apiClient;

  setUp(() {
    final dio = Dio(BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ));
    apiClient = ApiClient(dio);
  });

  group('ApiClient', () {
    test('deve retornar resposta quando a requisição é bem sucedida', () async {
      final result = await apiClient.get<Map<String, dynamic>>('/pokemon');

      expect(result.statusCode, 200);
      expect(result.data, isNotNull);
      expect(result.data!['results'], isNotEmpty);
    });

    test('deve lançar ApiException quando a URL é inválida', () async {
      expect(
        () => apiClient.get<Map<String, dynamic>>('/invalid-url'),
        throwsA(isA<ApiException>()),
      );
    });

    test('deve lançar ApiException quando o timeout é excedido', () async {
      final dio = Dio(BaseOptions(
        baseUrl: 'https://pokeapi.co/api/v2/',
        connectTimeout: const Duration(milliseconds: 1),
        receiveTimeout: const Duration(milliseconds: 1),
      ));
      final client = ApiClient(dio);

      expect(
        () => client.get<Map<String, dynamic>>('/pokemon'),
        throwsA(isA<ApiException>()),
      );
    });
  });
}

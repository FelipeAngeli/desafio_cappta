import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:desafio_cappta/viewmodel/pokemon_detail_viewmodel.dart';
import 'package:desafio_cappta/data/repository/pokemon_repository.dart';
import 'package:desafio_cappta/core/network/api_client.dart';
import 'package:dio/dio.dart';

void main() {
  late ProviderContainer container;
  late PokemonRepository repository;
  late ApiClient apiClient;
  late Dio dio;

  setUp(() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2/',
    ));
    apiClient = ApiClient(dio);
    repository = PokemonRepository(apiClient);
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  group('PokemonDetailViewModel', () {
    test('deve iniciar no estado de loading', () async {
      // Arrange
      const pokemonUrl = 'pokemon/1/';

      // Act
      final detailAsync = container.read(pokemonDetailProvider(pokemonUrl));

      // Assert
      expect(detailAsync, isA<AsyncLoading>());
    });

    test('deve carregar detalhes do pokémon com sucesso', () async {
      // Arrange
      const pokemonUrl = 'pokemon/1/';

      // Act
      final detailAsync = container.read(pokemonDetailProvider(pokemonUrl));

      // Assert
      expect(detailAsync, isA<AsyncLoading>());

      final detail = await repository.fetchPokemonDetail(pokemonUrl);
      expect(detail.height, isNotNull);
      expect(detail.weight, isNotNull);
      expect(detail.types, isNotEmpty);
    });

    test('deve lançar erro ao buscar pokémon com URL inválida', () async {
      // Arrange
      const invalidUrl = 'pokemon/invalid/';

      // Act & Assert
      expect(
        () => repository.fetchPokemonDetail(invalidUrl),
        throwsException,
      );
    });

    test('deve lidar com timeout na requisição', () async {
      // Arrange
      const pokemonUrl = 'pokemon/1/';
      final timeoutDio = Dio(BaseOptions(
        baseUrl: 'https://pokeapi.co/api/v2/',
        connectTimeout: const Duration(milliseconds: 1),
        receiveTimeout: const Duration(milliseconds: 1),
      ));

      final timeoutApiClient = ApiClient(timeoutDio);
      final timeoutRepository = PokemonRepository(timeoutApiClient);

      // Act & Assert
      expect(
        () => timeoutRepository.fetchPokemonDetail(pokemonUrl),
        throwsException,
      );
    });

    test('deve lidar com erro de conexão', () async {
      // Arrange
      const pokemonUrl = 'pokemon/1/';
      final offlineDio = Dio(BaseOptions(
        baseUrl: 'https://invalid-url-that-does-not-exist.com/',
      ));

      final offlineApiClient = ApiClient(offlineDio);
      final offlineRepository = PokemonRepository(offlineApiClient);

      // Act & Assert
      expect(
        () => offlineRepository.fetchPokemonDetail(pokemonUrl),
        throwsException,
      );
    });
  });
}

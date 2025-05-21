import 'package:flutter_test/flutter_test.dart';
import 'package:desafio_cappta/data/repository/pokemon_repository.dart';
import 'package:desafio_cappta/core/network/api_client.dart';
import 'package:dio/dio.dart';

void main() {
  late PokemonRepository repository;
  late ApiClient apiClient;
  late Dio dio;

  setUp(() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2/',
    ));
    apiClient = ApiClient(dio);
    repository = PokemonRepository(apiClient);
  });

  group('PokemonRepository', () {
    test('deve buscar lista de pokémons com sucesso', () async {
      // Act
      final pokemons = await repository.fetchAllPokemons();

      // Assert
      expect(pokemons, isNotEmpty);
      expect(pokemons.first.name, isNotEmpty);
      expect(pokemons.first.url, isNotEmpty);
    });

    test('deve buscar detalhes do pokémon com sucesso', () async {
      // Arrange
      const pokemonUrl = 'pokemon/1/';

      // Act
      final pokemonDetail = await repository.fetchPokemonDetail(pokemonUrl);

      // Assert
      expect(pokemonDetail.height, isNotNull);
      expect(pokemonDetail.weight, isNotNull);
      expect(pokemonDetail.types, isNotEmpty);
    });

    test('deve lançar exceção ao buscar pokémon com URL inválida', () async {
      // Arrange
      const invalidUrl = 'pokemon/invalid/';

      // Act & Assert
      expect(
        () => repository.fetchPokemonDetail(invalidUrl),
        throwsException,
      );
    });
  });
}

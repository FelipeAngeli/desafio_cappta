import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:desafio_cappta/core/network/api_client.dart';
import 'package:desafio_cappta/data/repository/pokemon_repository.dart';
import 'package:desafio_cappta/data/models/pokemon_model.dart';
import 'package:desafio_cappta/data/models/pokemon_detail_model.dart';

void main() {
  late PokemonRepository repository;

  setUp(() {
    final dio = Dio(BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ));
    final apiClient = ApiClient(dio);
    repository = PokemonRepository(apiClient);
  });

  group('PokemonRepository', () {
    test('deve retornar lista de pokémons quando a requisição é bem sucedida',
        () async {
      final result = await repository.fetchAllPokemons();

      expect(result, isA<List<PokemonModel>>());
      expect(result, isNotEmpty);
      expect(result.first.name, isNotEmpty);
      expect(result.first.url, isNotEmpty);
    });

    test('deve retornar detalhes do pokémon quando a requisição é bem sucedida',
        () async {
      final result = await repository
          .fetchPokemonDetail('https://pokeapi.co/api/v2/pokemon/1/');

      expect(result, isA<PokemonDetailModel>());
      expect(result.height, isNotNull);
      expect(result.weight, isNotNull);
      expect(result.types, isNotEmpty);
    });

    test('deve lançar exceção quando a URL é inválida', () async {
      expect(
        () => repository
            .fetchPokemonDetail('https://pokeapi.co/api/v2/pokemon/invalid/'),
        throwsException,
      );
    });
  });
}

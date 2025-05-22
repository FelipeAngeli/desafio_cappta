import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:desafio_cappta/viewmodel/pokemon_viewmodel.dart';
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
    container = ProviderContainer(
      overrides: [
        pokemonViewModelProvider.overrideWith(
          (ref) => PokemonViewModel(repository),
        ),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('PokemonViewModel', () {
    test('deve carregar lista de pokémons com sucesso', () async {
      // Act
      final notifier = container.read(pokemonViewModelProvider.notifier);
      await notifier.fetchPokemons();

      // Assert
      final state = container.read(pokemonViewModelProvider);
      expect(state, isA<AsyncData>());
      expect(state.value, isNotEmpty);
      expect(state.value!.first.name, isNotEmpty);
      expect(state.value!.first.url, isNotEmpty);
    });

    test('deve iniciar com estado de loading', () {
      // Arrange
      container = ProviderContainer(
        overrides: [
          pokemonViewModelProvider.overrideWith(
            (ref) => PokemonViewModel(repository),
          ),
        ],
      );

      // Assert
      final state = container.read(pokemonViewModelProvider);
      expect(state, isA<AsyncLoading>());
    });
  });
}

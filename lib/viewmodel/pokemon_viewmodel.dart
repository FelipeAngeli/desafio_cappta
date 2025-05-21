import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/pokemon_model.dart';
import '../data/repositories/pokemon_repository.dart';
import '../di/service_locator.dart';

final pokemonViewModelProvider =
    StateNotifierProvider<PokemonViewModel, AsyncValue<List<PokemonModel>>>(
  (ref) => PokemonViewModel(getIt<PokemonRepository>()),
);

class PokemonViewModel extends StateNotifier<AsyncValue<List<PokemonModel>>> {
  final PokemonRepository repository;

  PokemonViewModel(this.repository) : super(const AsyncLoading()) {
    fetchPokemons();
  }

  Future<void> fetchPokemons() async {
    try {
      final pokemons = await repository.fetchAllPokemons();
      state = AsyncData(pokemons);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

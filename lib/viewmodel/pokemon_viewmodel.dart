import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/pokemon_model.dart';
import '../data/repository/pokemon_repository.dart';
import '../di/service_locator.dart';

final pokemonViewModelProvider =
    StateNotifierProvider<PokemonViewModel, AsyncValue<List<PokemonModel>>>(
  (ref) => PokemonViewModel(getIt<PokemonRepository>()),
);

class PokemonViewModel extends StateNotifier<AsyncValue<List<PokemonModel>>> {
  final PokemonRepository _repository;

  PokemonViewModel(this._repository) : super(const AsyncLoading()) {
    _initialize();
  }

  Future<void> _initialize() async {
    await fetchPokemons();
  }

  Future<void> fetchPokemons() async {
    try {
      state = const AsyncLoading();
      final pokemons = await _repository.fetchAllPokemons();
      state = AsyncData(pokemons);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

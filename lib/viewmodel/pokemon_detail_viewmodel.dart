import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/pokemon_detail_model.dart';
import '../data/repository/pokemon_repository.dart';
import '../di/service_locator.dart';

final pokemonDetailProvider = FutureProvider.family<PokemonDetailModel, String>(
  (ref, url) async {
    final repository = getIt<PokemonRepository>();
    return await repository.fetchPokemonDetail(url);
  },
);

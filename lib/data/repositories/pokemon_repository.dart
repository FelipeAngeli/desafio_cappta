import 'package:flutter/foundation.dart';
import '../../core/network/api_client.dart';
import '../models/pokemon_model.dart';

class PokemonRepository {
  final ApiClient apiClient;

  PokemonRepository(this.apiClient);

  Future<List<PokemonModel>> fetchAllPokemons() async {
    try {
      final response = await apiClient.get<Map<String, dynamic>>(
        'pokemon',
        queryParameters: {'limit': 1300},
      );

      final List<dynamic> results = response.data?['results'] ?? [];

      final parsedList = await compute(parsePokemonList, results);

      return parsedList;
    } catch (e) {
      throw Exception('Erro ao buscar pokémons: $e');
    }
  }
}

List<PokemonModel> parsePokemonList(List<dynamic> results) {
  return results
      .map((pokemonJson) => PokemonModel.fromJson(pokemonJson))
      .toList();
}

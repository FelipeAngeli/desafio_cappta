import 'package:flutter/foundation.dart';
import '../../core/network/api_client.dart';
import '../models/pokemon_model.dart';
import '../models/pokemon_detail_model.dart';

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

      final parsedList = await compute(_parsePokemonList, results);

      return parsedList;
    } catch (e) {
      throw Exception('Erro ao buscar pokémons: $e');
    }
  }

  Future<PokemonDetailModel> fetchPokemonDetail(String url) async {
    try {
      final response = await apiClient.get<Map<String, dynamic>>(url);
      return PokemonDetailModel.fromJson(response.data!);
    } catch (e) {
      throw Exception('Erro ao buscar detalhes do Pokémon: $e');
    }
  }
}

/// Função isolada para parsing, usada com compute()
List<PokemonModel> _parsePokemonList(List<dynamic> results) {
  return results
      .map((pokemonJson) => PokemonModel.fromJson(pokemonJson))
      .toList();
}

import '../../core/network/api_client.dart';
import '../models/pokemon_model.dart';
import '../models/pokemon_detail_model.dart';
import '../../core/isolates/pokemon_isolate.dart';
import '../../core/isolates/pokemon_detail_isolate.dart';

class PokemonRepository {
  final ApiClient _apiClient;
  static const _basePath = 'pokemon';
  static const _maxPokemons = 1300;

  PokemonRepository(this._apiClient);

  Future<List<PokemonModel>> fetchAllPokemons() async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(
        _basePath,
        queryParameters: {'limit': _maxPokemons},
      );

      final results = response.data?['results'] as List? ?? [];
      return await PokemonIsolate.parsePokemonList(results);
    } catch (e) {
      throw Exception('Erro ao buscar pokémons: $e');
    }
  }

  Future<PokemonDetailModel> fetchPokemonDetail(String url) async {
    try {
      final response = await _apiClient.get<Map<String, dynamic>>(url);
      return await PokemonDetailIsolate.parsePokemonDetail(response.data!);
    } catch (e) {
      throw Exception('Erro ao buscar detalhes do Pokémon: $e');
    }
  }
}

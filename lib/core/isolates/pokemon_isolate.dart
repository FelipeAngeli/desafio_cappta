import 'package:flutter/foundation.dart';
import '../../data/models/pokemon_model.dart';

class PokemonIsolate {
  static Future<List<PokemonModel>> parsePokemonList(List<dynamic> data) async {
    return compute(_parsePokemonList, data);
  }

  static List<PokemonModel> _parsePokemonList(List<dynamic> data) {
    return data
        .map((pokemonJson) => PokemonModel.fromJson(pokemonJson))
        .toList();
  }
}

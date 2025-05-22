import 'package:flutter/foundation.dart';
import '../../data/models/pokemon_detail_model.dart';

class PokemonDetailIsolate {
  static Future<PokemonDetailModel> parsePokemonDetail(
      Map<String, dynamic> data) async {
    return compute(_parsePokemonDetail, data);
  }

  static PokemonDetailModel _parsePokemonDetail(Map<String, dynamic> data) {
    return PokemonDetailModel.fromJson(data);
  }
}

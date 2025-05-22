import 'package:flutter_test/flutter_test.dart';
import 'package:desafio_cappta/core/utils/pokemon_isolate.dart';
import 'package:desafio_cappta/data/models/pokemon_model.dart';

void main() {
  group('PokemonIsolate', () {
    test('should parse a list of pokemon data correctly', () async {
      // Arrange
      final data = [
        {'name': 'bulbasaur', 'url': 'https://pokeapi.co/api/v2/pokemon/1/'},
        {'name': 'ivysaur', 'url': 'https://pokeapi.co/api/v2/pokemon/2/'},
      ];

      // Act
      final result = await PokemonIsolate.parsePokemonList(data);

      // Assert
      expect(result, isA<List<PokemonModel>>());
      expect(result.length, 2);
      expect(result[0].name, 'bulbasaur');
      expect(result[1].url, 'https://pokeapi.co/api/v2/pokemon/2/');
    });
  });
}

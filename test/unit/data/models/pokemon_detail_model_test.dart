import 'package:flutter_test/flutter_test.dart';
import 'package:desafio_cappta/data/models/pokemon_detail_model.dart';

void main() {
  group('PokemonDetailModel', () {
    test('deve criar um PokemonDetailModel a partir de um JSON válido', () {
      // Arrange
      final json = {
        'height': 7,
        'weight': 69,
        'types': [
          {
            'type': {'name': 'grass'}
          },
          {
            'type': {'name': 'poison'}
          },
        ],
      };

      // Act
      final pokemonDetail = PokemonDetailModel.fromJson(json);

      // Assert
      expect(pokemonDetail.height, 7);
      expect(pokemonDetail.weight, 69);
      expect(pokemonDetail.types, ['grass', 'poison']);
    });

    test('deve criar um PokemonDetailModel com lista de tipos vazia', () {
      // Arrange
      final json = {
        'height': 7,
        'weight': 69,
        'types': [],
      };

      // Act
      final pokemonDetail = PokemonDetailModel.fromJson(json);

      // Assert
      expect(pokemonDetail.height, 7);
      expect(pokemonDetail.weight, 69);
      expect(pokemonDetail.types, isEmpty);
    });

    test('deve criar um PokemonDetailModel com valores zerados', () {
      // Arrange
      final json = {
        'height': 0,
        'weight': 0,
        'types': [],
      };

      // Act
      final pokemonDetail = PokemonDetailModel.fromJson(json);

      // Assert
      expect(pokemonDetail.height, 0);
      expect(pokemonDetail.weight, 0);
      expect(pokemonDetail.types, isEmpty);
    });
  });
}

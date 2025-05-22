import 'package:flutter_test/flutter_test.dart';
import 'package:desafio_cappta/core/isolates/pokemon_detail_isolate.dart';
import 'package:desafio_cappta/data/models/pokemon_detail_model.dart';

void main() {
  group('PokemonDetailIsolate', () {
    test('deve processar dados do pokémon corretamente', () async {
      // Arrange
      final data = <String, dynamic>{
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
      final result = await PokemonDetailIsolate.parsePokemonDetail(data);

      // Assert
      expect(result, isA<PokemonDetailModel>());
      expect(result.height, 7);
      expect(result.weight, 69);
      expect(result.types, containsAll(['grass', 'poison']));
    });

    test('deve lançar erro quando dados estão vazios', () async {
      // Arrange
      final data = <String, dynamic>{};

      // Act & Assert
      expect(
        () => PokemonDetailIsolate.parsePokemonDetail(data),
        throwsA(isA<TypeError>()),
      );
    });

    test('deve processar dados com lista de tipos vazia', () async {
      // Arrange
      final data = <String, dynamic>{
        'height': 7,
        'weight': 69,
        'types': [],
      };

      // Act
      final result = await PokemonDetailIsolate.parsePokemonDetail(data);

      // Assert
      expect(result.height, 7);
      expect(result.weight, 69);
      expect(result.types, isEmpty);
    });

    test('deve processar dados com valores zerados', () async {
      // Arrange
      final data = <String, dynamic>{
        'height': 0,
        'weight': 0,
        'types': [],
      };

      // Act
      final result = await PokemonDetailIsolate.parsePokemonDetail(data);

      // Assert
      expect(result.height, 0);
      expect(result.weight, 0);
      expect(result.types, isEmpty);
    });

    test('deve lançar erro quando tipo é nulo', () async {
      // Arrange
      final data = <String, dynamic>{
        'height': 7,
        'weight': 69,
        'types': [
          {'type': null},
        ],
      };

      // Act & Assert
      expect(
        () => PokemonDetailIsolate.parsePokemonDetail(data),
        throwsA(isA<NoSuchMethodError>()),
      );
    });
  });
}

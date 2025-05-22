import 'package:flutter_test/flutter_test.dart';
import 'package:desafio_cappta/core/utils/pokemon_detail_isolate.dart';
import 'package:desafio_cappta/data/models/pokemon_detail_model.dart';

void main() {
  group('PokemonDetailIsolate', () {
    test('should parse pokemon detail data correctly', () async {
      // Arrange
      final data = {
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
  });
}

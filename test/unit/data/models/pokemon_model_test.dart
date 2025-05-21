import 'package:flutter_test/flutter_test.dart';
import 'package:desafio_cappta/data/models/pokemon_model.dart';

void main() {
  group('PokemonModel', () {
    test('deve criar um PokemonModel a partir de um JSON válido', () {
      // Arrange
      final json = {
        'name': 'bulbasaur',
        'url': 'https://pokeapi.co/api/v2/pokemon/1/',
      };

      // Act
      final pokemon = PokemonModel.fromJson(json);

      // Assert
      expect(pokemon.name, 'bulbasaur');
      expect(pokemon.url, 'https://pokeapi.co/api/v2/pokemon/1/');
    });

    test('deve lançar TypeError quando JSON é inválido', () {
      // Arrange
      final json = {
        'name': 'bulbasaur',
        // url está faltando
      };

      // Act & Assert
      expect(
        () => PokemonModel.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('deve criar um PokemonModel com valores vazios', () {
      // Arrange
      final json = {
        'name': '',
        'url': '',
      };

      // Act
      final pokemon = PokemonModel.fromJson(json);

      // Assert
      expect(pokemon.name, '');
      expect(pokemon.url, '');
    });
  });
}

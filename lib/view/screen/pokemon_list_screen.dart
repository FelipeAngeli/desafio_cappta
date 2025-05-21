import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/pokemon_viewmodel.dart';
import '../witgets/pokemon_list_item.dart';

class PokemonListScreen extends ConsumerWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonState = ref.watch(pokemonViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex'),
      ),
      body: pokemonState.when(
        data: (pokemons) => ListView.builder(
          itemCount: pokemons.length,
          itemBuilder: (context, index) {
            final pokemon = pokemons[index];
            return PokemonListItem(
              name: pokemon.name,
              url: pokemon.url,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: pokemon,
                );
              },
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Erro: $error')),
      ),
    );
  }
}

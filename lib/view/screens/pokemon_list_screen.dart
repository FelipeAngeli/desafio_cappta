import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/pokemon_viewmodel.dart';
import '../witgets/pokemon_app_bar.dart';
import '../witgets/pokemon_card_container.dart';
import '../witgets/pokemon_list_item.dart';

class PokemonListScreen extends ConsumerWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonState = ref.watch(pokemonViewModelProvider);

    return Scaffold(
      appBar: const PokemonAppBar(title: 'Pokédex'),
      body: pokemonState.when(
        data: (pokemons) => ListView.builder(
          itemCount: pokemons.length,
          itemBuilder: (context, index) {
            final pokemon = pokemons[index];
            return PokemonCardContainer(
              child: PokemonListItem(
                name: pokemon.name,
                url: pokemon.url,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/details',
                    arguments: pokemon,
                  );
                },
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Erro: $error')),
      ),
    );
  }
}

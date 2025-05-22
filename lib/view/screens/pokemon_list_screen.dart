import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/pokemon_viewmodel.dart';
import '../witgets/pokemon_app_bar.dart';
import '../witgets/pokemon_card_container.dart';
import '../witgets/pokemon_list_item.dart';

class PokemonListScreen extends ConsumerStatefulWidget {
  const PokemonListScreen({super.key});

  @override
  ConsumerState<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends ConsumerState<PokemonListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pokemonState = ref.watch(pokemonViewModelProvider);

    return Scaffold(
      appBar: const PokemonAppBar(title: 'Pokédex'),
      body: pokemonState.when(
        data: (pokemons) => ListView.builder(
          controller: _scrollController,
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
      // Botão flutuante para voltar ao topo
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToTop,
        child: const Icon(Icons.arrow_upward),
        tooltip: 'Voltar ao topo',
      ),
    );
  }
}

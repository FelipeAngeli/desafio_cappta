import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/pokemon_utils.dart';
import '../../data/models/pokemon_model.dart';
import '../../viewmodel/pokemon_detail_viewmodel.dart';
import '../witgets/pokemon_app_bar.dart';
import '../witgets/pokemon_detail_card.dart';

class PokemonDetailScreen extends ConsumerWidget {
  const PokemonDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PokemonModel pokemon =
        ModalRoute.of(context)!.settings.arguments as PokemonModel;

    final detailAsync = ref.watch(pokemonDetailProvider(pokemon.url));

    return Scaffold(
      appBar: PokemonAppBar(title: pokemon.name),
      body: detailAsync.when(
        data: (detail) => PokemonDetailCard(
          imageUrl: getPokemonImage(pokemon.url),
          detail: detail,
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, _) => Center(
          child: Text('Erro: $error'),
        ),
      ),
    );
  }
}

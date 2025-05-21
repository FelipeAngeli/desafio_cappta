import 'package:flutter/material.dart';

class PokemonListItem extends StatelessWidget {
  final String name;
  final String url;
  final VoidCallback onTap;

  const PokemonListItem({
    super.key,
    required this.name,
    required this.url,
    required this.onTap,
  });

  String getPokemonImage() {
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;
    final id = segments[segments.length - 2]; // penúltimo segmento: '1'
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        getPokemonImage(),
        width: 50,
        height: 50,
        fit: BoxFit.contain,
      ),
      title: Text(name.toUpperCase()),
      onTap: onTap,
    );
  }
}

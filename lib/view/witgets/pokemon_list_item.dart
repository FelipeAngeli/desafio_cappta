import 'package:flutter/material.dart';
import '../../core/utils/pokemon_utils.dart';

class PokemonListItem extends StatelessWidget {
  final String? name;
  final String? url;
  final VoidCallback onTap;

  const PokemonListItem({
    super.key,
    required this.name,
    required this.url,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = getPokemonImage(url);

    return ListTile(
      leading: imageUrl.isNotEmpty
          ? Image.network(
              imageUrl,
              width: 50,
              height: 50,
              cacheWidth: 100,
              cacheHeight: 100,
              fit: BoxFit.contain,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.error,
                size: 40,
                color: Colors.red,
              ),
            )
          : const Icon(
              Icons.image_not_supported,
              size: 40,
            ),
      title: Text(
        name?.toUpperCase() ?? 'Nome desconhecido',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}

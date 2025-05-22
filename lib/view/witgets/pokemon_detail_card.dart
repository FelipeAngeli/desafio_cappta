import 'package:flutter/material.dart';
import '../../data/models/pokemon_detail_model.dart';
import 'app_button.dart';

class PokemonDetailCard extends StatelessWidget {
  final String? imageUrl;
  final PokemonDetailModel? detail;

  const PokemonDetailCard({
    super.key,
    required this.imageUrl,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    if (detail == null) {
      return const Center(
        child: Text('Detalhes indisponíveis'),
      );
    }

    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            imageUrl != null && imageUrl!.isNotEmpty
                ? SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.network(
                      imageUrl!,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.error,
                        size: 80,
                        color: Colors.red,
                      ),
                    ),
                  )
                : const Icon(
                    Icons.image_not_supported,
                    size: 100,
                  ),
            const SizedBox(height: 24),
            Card(
              elevation: 8,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Color.fromARGB(255, 170, 246, 163),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Altura: '
                      '${detail!.height != 0 ? detail!.height : 'Altura desconhecida'}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Peso: ${detail!.weight != 0 ? detail!.weight : 'Peso desconhecido'}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tipos: ${detail!.types.isNotEmpty ? detail!.types.join(', ') : 'Tipo desconhecido'}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            AppButton(
              label: 'Voltar',
              icon: Icons.arrow_back,
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

String getPokemonImage(String? url) {
  if (url == null) return '';

  try {
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;

    for (int i = segments.length - 1; i >= 0; i--) {
      final segment = segments[i];
      if (int.tryParse(segment) != null) {
        final imageUrl =
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$segment.png';
        return imageUrl;
      }
    }
    return '';
  } catch (e) {
    return '';
  }
}

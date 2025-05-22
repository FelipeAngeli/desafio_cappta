class PokemonDetailModel {
  final int height;
  final int weight;
  final List<String> types;

  PokemonDetailModel({
    required this.height,
    required this.weight,
    required this.types,
  });

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    final typesList = (json['types'] as List)
        .map((type) => type['type']['name'] as String)
        .toList();

    return PokemonDetailModel(
      height: json['height'],
      weight: json['weight'],
      types: typesList,
    );
  }
}

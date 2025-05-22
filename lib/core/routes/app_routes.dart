import 'package:flutter/material.dart';
import '../../view/screens/pokemon_list_screen.dart';
import '../../view/screens/pokemon_detail_screen.dart';

class AppRoutes {
  static const String home = '/';

  static const String details = '/details';

  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const PokemonListScreen(),
        details: (context) => const PokemonDetailScreen(),
      };
}

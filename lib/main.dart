import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'di/service_locator.dart';
import 'view/screens/pokemon_list_screen.dart';
import 'view/screens/pokemon_detail_screen.dart';

void main() {
  setupLocator();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokédex',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const PokemonListScreen(),
      routes: {
        '/details': (context) => const PokemonDetailScreen(),
      },
    );
  }
}

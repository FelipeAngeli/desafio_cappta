import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'di/service_locator.dart';
import 'view/screen/pokemon_list_screen.dart';

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
      title: 'Pokédex',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const PokemonListScreen(),
      routes: {
        '/details': (context) => const Placeholder(), // Ajustar depois
      },
    );
  }
}

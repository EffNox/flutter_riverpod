import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/providers/pokemon_provider.dart';

class PokemonPage extends ConsumerWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonId = ref.watch(pokemonIdProvider);
    // final pokemonAsync = ref.watch(pokemonNaemProvider(pokemonId));
    final pokemonAsync = ref.watch(pokemonNaemProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Pokemon: $pokemonId')),
      body: Center(
        child: pokemonAsync.when(
          data: (v) => Text(v),
          error: (error, stackTrace) => Text('Error: $error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Icon(Icons.plus_one_outlined),
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).update((v) => v + 1);
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).update((v) => v - 1);
            },
            child: const Icon(Icons.exposure_minus_1_outlined),
          ),
        ],
      ),
    );
  }
}

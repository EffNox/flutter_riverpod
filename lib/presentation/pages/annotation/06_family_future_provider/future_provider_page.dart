import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/providers/providers.dart';

class FamilyFuturePage extends ConsumerStatefulWidget {
  const FamilyFuturePage({super.key});

  @override
  FamilyFuturePageState createState() => FamilyFuturePageState();
}

class FamilyFuturePageState extends ConsumerState<FamilyFuturePage> {
  int pokemonId = 1;
  @override
  Widget build(BuildContext context) {
    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));

    return Scaffold(
      appBar: AppBar(title: Text('Pokeon ID: $pokemonId')),
      body: Center(
        child: pokemonAsync.when(
          data: (data) => Text(data),
          error: (error, stackTrace) => Text('$error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn-2',
            child: const Icon(Icons.plus_one),
            onPressed: () {
              pokemonId++;
              setState(() {});
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1_outlined),
            onPressed: () {
              if (pokemonId <= 1) return;
              pokemonId--;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

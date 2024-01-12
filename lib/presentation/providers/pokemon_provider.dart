import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/helpers/pokemon_service.dart';

final pokemonIdProvider = StateProvider<int>((ref) => 1);
// De esta forma mantiene los valores anteriores
// final pokemonNaemProvider = FutureProvider.family<String, int>((ref, id) => PokemonService.getPokemonName(id));

final pokemonNaemProvider = FutureProvider<String>((ref) => PokemonService.getPokemonName(ref.watch(pokemonIdProvider)));

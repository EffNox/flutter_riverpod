import 'package:river_app/config/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'future2_providers.g.dart';

@Riverpod(keepAlive: true)
// @riverpod
FutureOr<String> pokemonName(PokemonNameRef ref) async {
  final pokemonId = ref.watch(pokemonIdProvider);

  final pokemonName = await PokemonService.getPokemonName(pokemonId);
  // keepAlive: false
  // ref.onDispose(() {
  //   print('Estamos a punto de eliminar este provider');
  // });
  return pokemonName;
}

@Riverpod(keepAlive: true)
class PokemonId extends _$PokemonId {
  @override
  int build() => 1;

  nextPokemon() => state++;

  prevPokemon() => state--;
}

@Riverpod(keepAlive: true)
Future<String> pokemon(PokemonRef ref, int pokemonId) async {
  final pokemonName = await PokemonService.getPokemonName(pokemonId);
  return pokemonName;
}

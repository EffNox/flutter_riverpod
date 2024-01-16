import 'package:dio/dio.dart';

class PokemonService {
  static Future<String> getPokemonName(int pokemonId) async {
    final dio = Dio();
    // await Future.delayed(const Duration(seconds: 2));
    try {
      final rs = await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonId');
      // print('$pokemonId ${rs.data['name'] ?? ''}');
      return rs.data['name'] ?? '';
    } catch (e) {
      throw 'Name not found';
    }
  }
}

import 'package:pokemon_go/presentation/template/template.dart';

import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class ApiRequest {
  final client = http.Client();

  final baseUrl = 'pokeapi.co';

  Future<PokemonPageListRes> getPokemonPage() async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon', {'limit': '1154'});

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return PokemonPageListRes.fromJson(json);
  }

  Future getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/$pokemonId');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);

      return PokemonInfoRes.fromJson(json);
    } catch (e) {
      developer.log('Failed to get pokemon info', error: e);
    }
  }

  Future getPokemonSpeciesInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon-species/$pokemonId');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);

      return PokemonSpeciesRes.fromJson(json);
    } catch (e) {
      developer.log('Failed to get pokemon species info', error: e);
    }
  }
}

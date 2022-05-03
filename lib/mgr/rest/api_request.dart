import 'package:pokemon_go/presentation/template/template.dart';

import 'package:http/http.dart' as http;

import 'dart:developer' as developer;

class ApiRequest {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPageResponse> getPokemonPage() async {
    final queryParameters = {'limit': '1126'};

    final uri = Uri.https(baseUrl, '/api/v2/pokemon', queryParameters);

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return PokemonPageResponse.fromJson(json);
  }

  Future getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/$pokemonId');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);

      return PokemonInfoResponse.fromJson(json);
    } catch (e) {
      developer.log('Failed to get pokemon info', error: e);
    }
  }

  Future getPokemonSpeciesInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon-species/$pokemonId');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);

      return PokemonSpeciesInfoResponse.fromJson(json);
    } catch (e) {
      developer.log('Failed to get pokemon species info', error: e);
    }
  }
}

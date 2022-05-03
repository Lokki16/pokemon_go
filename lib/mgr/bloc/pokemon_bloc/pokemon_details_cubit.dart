import 'package:pokemon_go/presentation/template/template.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails> {
  final _apiRequest = ApiRequest();

  PokemonDetailsCubit()
      : super(PokemonDetails(
          id: 0,
          name: '',
          imageUrl: '',
          types: [],
          height: 0,
          weight: 0,
          description: '',
        ));

  void getPokemonDetails(int pokemonId) async {
    final responses = await Future.wait([
      _apiRequest.getPokemonInfo(pokemonId),
      _apiRequest.getPokemonSpeciesInfo(pokemonId),
    ]);

    final pokemonInfo = responses[0] as PokemonInfoResponse;
    final speciesInfo = responses[1] as PokemonSpeciesInfoResponse;

    emit(PokemonDetails(
      id: pokemonInfo.id,
      name: pokemonInfo.name,
      imageUrl: pokemonInfo.imageUrl,
      types: pokemonInfo.types,
      height: pokemonInfo.height,
      weight: pokemonInfo.weight,
      description: speciesInfo.description,
    ));
  }

  void clearPokemonDetails() => emit(PokemonDetails(
        id: 0,
        name: '',
        imageUrl: '',
        types: [],
        height: 0,
        weight: 0,
        description: '',
      ));
}

import 'package:pokemon_go/presentation/template/template.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _apiRequest = ApiRequest();

  PokemonBloc() : super(PokemonInitial());

  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    yield PokemonLoadInProgress();

    try {
      final pokemonPageResponse = await _apiRequest.getPokemonPage();
      yield PokemonPageLoadSuccess(
          pokemonListings: pokemonPageResponse.pokemonListings);
    } catch (e) {
      yield PokemonPageLoadFailed(error: e);
    }
  }
}

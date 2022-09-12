import 'package:pokemon_go/presentation/template/template.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonEvent>((event, emit) async {
      emit(PokemonLoadInProgress());

      try {
        final pokemonPageResponse = await ApiRequest().getPokemonPage();
        emit(PokemonPageLoadSuccess(listOfPokemon: pokemonPageResponse.list));
      } catch (e) {
        emit(PokemonPageLoadFailed(error: e));
      }
    });
  }
}

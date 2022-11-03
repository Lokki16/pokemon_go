import 'package:pokemon_go/presentation/template/template.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final ApiRequest _apiRequest = ApiRequest();

  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonEvent>((event, emit) async {
      emit(PokemonLoadInProgress());

      try {
        final PokemonPageListRes _allPokemonRes =
            await _apiRequest.getAllPokemon();
        emit(PokemonPageLoadSuccess(listOfPokemon: _allPokemonRes));
      } catch (e) {
        emit(PokemonPageLoadFailed(error: e));
      }
    });
  }
}

part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadInProgress extends PokemonState {}

class PokemonPageLoadSuccess extends PokemonState {
  final PokemonPageListRes listOfPokemon;

  PokemonPageLoadSuccess({required this.listOfPokemon});
}

class PokemonPageLoadFailed extends PokemonState {
  final Object error;

  PokemonPageLoadFailed({required this.error});
}

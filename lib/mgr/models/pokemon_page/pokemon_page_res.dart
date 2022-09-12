import 'package:json_annotation/json_annotation.dart';

part 'pokemon_page_res.g.dart';

@JsonSerializable(anyMap: true)
class PokemonPageRes {
  final int id;
  final String name;

  String get image =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  @override
  const PokemonPageRes({required this.id, required this.name});

  factory PokemonPageRes.fromJson(Map json) => _$PokemonPageResFromJson(json);

  Map toJson() => _$PokemonPageResToJson(this);
}

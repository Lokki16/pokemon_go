import 'package:json_annotation/json_annotation.dart';

part 'pokemon_species_res.g.dart';

@JsonSerializable(anyMap: true)
class PokemonSpeciesRes {
  @JsonKey(name: 'flavor_text_entries')
  final String flavorTextEntries;

  @override
  const PokemonSpeciesRes({required this.flavorTextEntries});

  factory PokemonSpeciesRes.fromJson(Map json) =>
      _$PokemonSpeciesResFromJson(json);

  Map toJson() => _$PokemonSpeciesResToJson(this);
}

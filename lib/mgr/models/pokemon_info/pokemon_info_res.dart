import 'package:json_annotation/json_annotation.dart';

part 'pokemon_info_res.g.dart';

@JsonSerializable(anyMap: true)
class PokemonInfoRes {
  final int id;
  final String name;
  final int height;
  final int weight;
  final List abilities;
  final List stats;
  final List types;

  @override
  const PokemonInfoRes({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.stats,
    required this.types,
  });

  factory PokemonInfoRes.fromJson(Map json) => _$PokemonInfoResFromJson(json);

  Map toJson() => _$PokemonInfoResToJson(this);
}

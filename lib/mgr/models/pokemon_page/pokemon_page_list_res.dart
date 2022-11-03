import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon_go/mgr/models/pokemon_page/pokemon_page_res.dart';

part 'pokemon_page_list_res.g.dart';

@JsonSerializable(anyMap: true)
class PokemonPageListRes {
  final PokemonPageListRes list;

  @override
  const PokemonPageListRes({required this.list});

  factory PokemonPageListRes.fromJson(Map json) =>
      _$PokemonPageListResFromJson(json);

  Map toJson() => _$PokemonPageListResToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_info_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonInfoRes _$PokemonInfoResFromJson(Map json) => PokemonInfoRes(
      id: json['id'] as int,
      name: json['name'] as String,
      height: json['height'] as int,
      weight: json['weight'] as int,
      abilities: json['abilities'] as List<dynamic>,
      stats: json['stats'] as List<dynamic>,
      types: json['types'] as List<dynamic>,
    );

Map<String, dynamic> _$PokemonInfoResToJson(PokemonInfoRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'abilities': instance.abilities,
      'stats': instance.stats,
      'types': instance.types,
    };

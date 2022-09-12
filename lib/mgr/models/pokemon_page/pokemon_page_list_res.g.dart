// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_page_list_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonPageListRes _$PokemonPageListResFromJson(Map json) => PokemonPageListRes(
      list: (json['list'] as List<dynamic>)
          .map((e) => PokemonPageRes.fromJson(e as Map))
          .toList(),
    );

Map<String, dynamic> _$PokemonPageListResToJson(PokemonPageListRes instance) =>
    <String, dynamic>{
      'list': instance.list,
    };

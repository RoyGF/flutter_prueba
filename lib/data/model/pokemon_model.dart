import 'package:json_annotation/json_annotation.dart';

part 'pokemon_model.g.dart'; 

@JsonSerializable(explicitToJson: true)
class PokemonModel {
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'id')
  final int id;

  PokemonModel({required this.name, required this.id});

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}

import 'package:isar/isar.dart';

part 'pokemon_data.g.dart';

@Collection()
class PokemonData {
  PokemonData({
    required this.name,
    required this.serverId,
  });

  Id id = Isar.autoIncrement;
  final String name;
  final int serverId;
}

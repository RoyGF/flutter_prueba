import 'package:isar/isar.dart';
import 'package:test_app/data/local/data_models/pokemon_data.dart';
import 'package:test_app/data/local/database.dart';

class IsarDB implements Database {
  const IsarDB({required this.isar});

  final Isar isar;

  @override
  Future<void> deleteAllPokemons() async {
    await isar.writeTxn(() async {
      await isar.pokemonDatas.clear();
    });
  }

  @override
  Future<List<PokemonData>> getPokemons() async {
    List<PokemonData> pokemons = await isar.pokemonDatas.where().findAll();
    return pokemons;
  }

  @override
  Future<void> savePokemons(List<PokemonData> pokemonData) async {
    await deleteAllPokemons();
    await isar.writeTxn(() async {
      await isar.pokemonDatas.putAll(pokemonData);
    });
  }
}

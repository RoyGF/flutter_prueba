import 'package:test_app/data/local/data_models/pokemon_data.dart';

abstract class Database {
  Future<void> savePokemons(List<PokemonData> pokemonData);
  Future<List<PokemonData>> getPokemons();
  Future<void> deleteAllPokemons();
}

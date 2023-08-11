import 'package:test_app/data/local/data_models/pokemon_data.dart';
import 'package:test_app/data/model/pokemon_model.dart';

class PokemonWrapper {
  PokemonData transformData(PokemonModel input) {
    return PokemonData(name: input.name, serverId: input.id);
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_app/data/local/data_models/pokemon_data.dart';

part 'pokemon_list_provider.g.dart';

@riverpod
class PokemonList extends _$PokemonList {
  @override
  List<PokemonData> build() {
    return [];
  }

  void setPokemonList(List<PokemonData> data) {
    state = data;
  }
}

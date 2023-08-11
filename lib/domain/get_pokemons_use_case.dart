import 'package:test_app/core/base_use_case.dart';
import 'package:test_app/core/data_response.dart';
import 'package:test_app/data/datasource/datasource.dart';

import '../data/local/data_models/pokemon_data.dart';

class GetPokemonsUseCase implements BaseUseCase<List<PokemonData>> {
  GetPokemonsUseCase({required this.dataSource});

  DataSource dataSource;

  @override
  Future<DataResponse<List<PokemonData>>> call() async {
    final response = await dataSource.getPokemons();

    return response.fold(
      (failure) => DataResponse<List<PokemonData>>(failure: failure),
      (response) => DataResponse<List<PokemonData>>(data: response),
    );
  }
}

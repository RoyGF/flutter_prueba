import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_app/core/data_response.dart';
import 'package:test_app/data/local/data_models/pokemon_data.dart';
import 'package:test_app/domain/get_pokemons_use_case.dart';
import 'package:test_app/presentation/modules/home/providers/pokemon_list_provider.dart';

part 'pokemon_controller.g.dart';

@riverpod
class PokemonController extends _$PokemonController {
  final getIt = GetIt.instance;

  @override
  FutureOr<DataResponse<List<PokemonData>>> build() {
    return DataResponse<List<PokemonData>>();
  }

  Future<void> getPokemons() async {
    GetPokemonsUseCase useCase = getIt<GetPokemonsUseCase>();
    state = const AsyncLoading();

    final response = await useCase.call();
    if (response.data != null) {
      _setPokemonData(response.data!);
    }
    state = AsyncData<DataResponse<List<PokemonData>>>(response);
  }

  void _setPokemonData(List<PokemonData> data) {
    ref.read(pokemonListProvider.notifier).setPokemonList(data);
  }
}

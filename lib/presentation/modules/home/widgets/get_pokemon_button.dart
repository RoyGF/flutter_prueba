import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../../core/data_response.dart';
import '../../../../data/local/data_models/pokemon_data.dart';
import '../../../widgets/primary_button.dart';
import '../controllers/pokemon_controller.dart';

class GetPokemonButton extends ConsumerWidget {
  final Function(DataResponse<List<PokemonData>>) callback;

  const GetPokemonButton({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(pokemonControllerProvider);

    ref.listen<AsyncValue<DataResponse<List<PokemonData>>>>(
      pokemonControllerProvider,
      (previous, next) {
        if (next is AsyncData<DataResponse<List<PokemonData>>>) {
          callback(next.value);
        }
      },
    );

    return PrimaryButton(
      label: "Get Books",
      isLoading: controller.isLoading,
      onClick: () {
        ref.read(pokemonControllerProvider.notifier).getPokemons();
      },
    );
  }
}

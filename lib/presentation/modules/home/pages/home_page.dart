import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/core/data_response.dart';
import 'package:test_app/presentation/modules/home/providers/pokemon_list_provider.dart';
import 'package:test_app/presentation/modules/home/widgets/get_pokemon_button.dart';

import '../../../../data/local/data_models/pokemon_data.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(pokemonListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Expanded(
            child: data.isNotEmpty
                ? ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(data[index].name),
                      );
                    },
                  )
                : const Center(
                    child: Text('No data'),
                  ),
          ),
          GetPokemonButton(callback: _onCallbackTriggered)
        ],
      ),
    );
  }

  void _onCallbackTriggered(DataResponse<List<PokemonData>> response) {
    if (response.failure != null) {
      final snackBar = SnackBar(content: Text(response.failure!.errorMessage));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

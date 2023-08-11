import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:test_app/core/failure.dart';
import 'package:test_app/data/model/pokemon_model.dart';
import 'package:test_app/data/remote/client/server_client.dart';

class DummyRepository implements ServerClient {
  @override
  Future<Either<Failure, List<PokemonModel>>> getPokemons() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/pokemon_data.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      final List<PokemonModel> pokemons =
          jsonList.map((jsonItem) => PokemonModel.fromJson(jsonItem)).toList();

      return Right(pokemons);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}

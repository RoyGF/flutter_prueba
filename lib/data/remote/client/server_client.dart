import 'package:dartz/dartz.dart';
import 'package:test_app/data/model/pokemon_model.dart';

import '../../../core/failure.dart';

abstract class ServerClient {
  Future<Either<Failure, List<PokemonModel>>> getPokemons();
}

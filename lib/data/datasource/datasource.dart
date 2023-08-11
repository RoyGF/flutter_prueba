import 'package:dartz/dartz.dart';
import 'package:test_app/core/failure.dart';
import 'package:test_app/data/local/data_models/pokemon_data.dart';

abstract class DataSource {
  Future<Either<Failure, List<PokemonData>>> getPokemons();
}

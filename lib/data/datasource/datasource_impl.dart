import 'package:dartz/dartz.dart';
import 'package:test_app/core/failure.dart';
import 'package:test_app/data/datasource/datasource.dart';
import 'package:test_app/data/local/data_models/pokemon_data.dart';
import 'package:test_app/data/local/database.dart';
import 'package:test_app/data/remote/client/server_client.dart';
import 'package:test_app/data/remote/network/network_info.dart';

import 'package:test_app/data/wrappers/wrapper.dart';

class DataSourceImpl implements DataSource {
  DataSourceImpl({
    required this.database,
    required this.serverClient,
    required this.networkInfo,
  });

  final Database database;
  final ServerClient serverClient;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<PokemonData>>> getPokemons() async {
    final bool isConnected = await networkInfo.isConnected();
    try {
      if (isConnected) {
        final networkResponse = await serverClient.getPokemons();

        return await networkResponse.fold((failure) => Left(failure),
            (response) async {
          List<PokemonData> data =
              response.map((e) => PokemonWrapper().transformData(e)).toList();
          await database.savePokemons(data);
          return Right(data);
        });
      } else {
        final localResponse = await database.getPokemons();
        return Right(localResponse);
      }
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}

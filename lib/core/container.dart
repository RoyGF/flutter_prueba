import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_app/data/local/data_models/pokemon_data.dart';
import 'package:test_app/domain/get_pokemons_use_case.dart';

import '../data/datasource/datasource.dart';
import '../data/datasource/datasource_impl.dart';
import '../data/local/database.dart';
import '../data/local/isar_db.dart';
import '../data/remote/client/dummy_repository.dart';
import '../data/remote/client/server_client.dart';
import '../data/remote/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      internetConnectionChecker: InternetConnectionChecker.createInstance(),
    ),
  );

  sl.registerLazySingleton<Database>(() => IsarDB(isar: sl()));
  sl.registerLazySingleton<ServerClient>(() => DummyRepository());

  // Data sources
  sl.registerLazySingleton<DataSource>(() => DataSourceImpl(
        networkInfo: sl(),
        database: sl(),
        serverClient: sl(),
      ));

  sl.registerLazySingleton(() => GetPokemonsUseCase(dataSource: sl()));

  sl.registerSingletonAsync<Isar>(
    () async {
      final dir = await getApplicationDocumentsDirectory();
      return Isar.getInstance('default') ??
          await Isar.open(
            [PokemonDataSchema],
            directory: dir.path,
          );
    },
  );
}

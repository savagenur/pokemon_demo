import 'package:get_it/get_it.dart';
import 'package:pokemon_demo/features/counter/data/datasources/remote_data_source/pokemon_data_source.dart';
import 'package:pokemon_demo/features/counter/data/repositories/pokemon_repository.dart';
import 'package:pokemon_demo/features/counter/domain/repositories/base_pokemon_repository.dart';
import 'package:pokemon_demo/features/counter/domain/usecases/fetch_pokemons_from_api_usecase.dart';
import 'package:pokemon_demo/features/counter/presentation/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokemon_demo/features/counter/presentation/bloc/settings/settings_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/counter/data/datasources/remote_data_source/base_pokemon_data_source.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
   await _initSharedPref();
  // Bloc
  sl.registerFactory(() => PokemonBloc(fetchPokemonsFromApiUsecase: sl.call()));
  sl.registerFactory(() => SettingsBloc());

  // Usecase
  sl.registerLazySingleton(
      () => FetchPokemonsFromApiUsecase(repository: sl.call()));

  // Repository
  sl.registerLazySingleton<BasePokemonRepository>(
      () => PokemonRepository(pokemonDataSource: sl.call()));
  sl.registerLazySingleton<BasePokemonDataSource>(() => PokemonDataSource());

  // External
}

Future<void> _initSharedPref() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPref);
}

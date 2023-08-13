import 'package:pokemon_demo/features/counter/data/datasources/remote_data_source/base_pokemon_data_source.dart';
import 'package:pokemon_demo/features/counter/data/models/pokemon/pokemon_model.dart';
import 'package:pokemon_demo/features/counter/domain/repositories/base_pokemon_repository.dart';

class PokemonRepository implements BasePokemonRepository {
  final BasePokemonDataSource pokemonDataSource;
  PokemonRepository({
    required this.pokemonDataSource,
  });
  @override
  Future<List<PokemonModel>> fetchPokemonsFromApi(int offset) async =>
      pokemonDataSource.fetchPokemonsFromApi( offset);

  @override
  Future<List<PokemonModel>> refreshData() async =>
      pokemonDataSource.refreshData();
}

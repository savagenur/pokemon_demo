import 'package:pokemon_demo/features/counter/data/models/pokemon/pokemon_model.dart';

abstract class BasePokemonDataSource {
  Future<List<PokemonModel>> fetchPokemonsFromApi(int offset);
  Future<List<PokemonModel>> refreshData();

}
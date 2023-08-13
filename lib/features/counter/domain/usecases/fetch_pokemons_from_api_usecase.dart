import 'package:pokemon_demo/features/counter/data/models/pokemon/pokemon_model.dart';
import 'package:pokemon_demo/features/counter/domain/repositories/base_pokemon_repository.dart';

class FetchPokemonsFromApiUsecase {
  final BasePokemonRepository repository;
  FetchPokemonsFromApiUsecase({
    required this.repository,
  });

  Future<List<PokemonModel>> call(int offset) async {
    return repository.fetchPokemonsFromApi(offset);
  }
}

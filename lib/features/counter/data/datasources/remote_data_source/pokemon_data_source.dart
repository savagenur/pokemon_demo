import 'dart:convert';

import 'package:pokemon_demo/features/counter/data/datasources/remote_data_source/base_pokemon_data_source.dart';
import 'package:pokemon_demo/features/counter/data/models/pokemon/pokemon_model.dart';
import 'package:http/http.dart' as http;

class PokemonDataSource implements BasePokemonDataSource {
  @override
  Future<List<PokemonModel>> fetchPokemonsFromApi(int offset) async {
    final List<PokemonModel> pokemons = [];
    final url =
        Uri.parse("https://pokeapi.co/api/v2/pokemon/?limit=20&offset=$offset");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> body = json.decode(response.body);
      final List results = body["results"];
      await Future.wait(results.map((item) async {
        final url = Uri.parse(item["url"]);
        final response = await http.get(url);
        final newPokemon = json.decode(response.body);
        pokemons.add(PokemonModel.fromJson(newPokemon));
      }));
    }
    return pokemons;
  }

  @override
  Future<List<PokemonModel>> refreshData() {
    // TODO: implement refreshData
    throw UnimplementedError();
  }
}

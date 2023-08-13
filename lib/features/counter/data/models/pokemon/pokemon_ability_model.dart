
import 'package:pokemon_demo/features/counter/data/models/pokemon/name_model.dart';

class PokemonAbilityModel {
  final int? id;
  final String? name;
  final List<String>? names;
  PokemonAbilityModel({
    this.id,
    this.name,
    this.names,
  });
  
factory PokemonAbilityModel.fromJson(Map<String, dynamic> json) {
    return PokemonAbilityModel(
      id: json["id"],
      name: json["ability"]["name"],
      // names: json["names"].map((name)=>NameModel.fromJson(name)).toList(),
    );
  }
  
}

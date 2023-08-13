
class PokemonMoveModel {
  final String? name;
  PokemonMoveModel({
    this.name,
  });
  
 factory PokemonMoveModel.fromJson(json) {
    return PokemonMoveModel(
      name: json["move"]["name"]
    );
  }

}

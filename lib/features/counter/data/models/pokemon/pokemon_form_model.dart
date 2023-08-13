class PokemonFormModel {
  final int? id;
  final String? name;
  PokemonFormModel({
    this.id,
    this.name,
  });

  factory PokemonFormModel.fromJson(json) {
    return PokemonFormModel(
      id: json["id"],
      name: json["name"],
    );
  }
}

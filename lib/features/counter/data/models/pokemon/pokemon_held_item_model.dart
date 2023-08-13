class PokemonHeldItemModel {
  final String? name;
  PokemonHeldItemModel({
    this.name,
  });
  factory PokemonHeldItemModel.fromJson(json) {
    return PokemonHeldItemModel(
      name: json["item"]["name"]
    );
  }
}



class PokemonTypeModel {
  final int? slot;
  final String? type;
  PokemonTypeModel({
    this.slot,
    this.type,
  });

factory PokemonTypeModel.fromJson(json) {
    return PokemonTypeModel(
      slot: json["slot"],
      type: json["type"]["name"],
    );
  }
}


class PokemonStatModel {
  final String? name;
  final int? baseStat;
  PokemonStatModel({
    this.name,
    this.baseStat,
  });
  factory PokemonStatModel.fromJson(json) {
    return PokemonStatModel(
      name: json["stat"]["name"],
      baseStat: json["base_stat"],
    );
  }
}

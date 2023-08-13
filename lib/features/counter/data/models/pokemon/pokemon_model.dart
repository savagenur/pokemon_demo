import 'package:pokemon_demo/features/counter/data/models/pokemon/pokemon_ability_model.dart';
import 'package:pokemon_demo/features/counter/data/models/pokemon/pokemon_form_model.dart';
import 'package:pokemon_demo/features/counter/data/models/pokemon/pokemon_held_item_model.dart';
import 'package:pokemon_demo/features/counter/data/models/pokemon/pokemon_move_model.dart';
import 'package:pokemon_demo/features/counter/data/models/pokemon/pokemon_stat_model.dart';
import 'package:pokemon_demo/features/counter/data/models/pokemon/pokemon_type_model.dart';

class PokemonModel {
  final int? id;
  final String? name;
  final int? baseExp;
  final int? height;
  final bool? isDefault;
  final int? order;
  final int? weight;
  final List<PokemonAbilityModel>? abilities;
  final List<PokemonFormModel>? forms;
  final List<PokemonStatModel>? stats;
  final List<PokemonTypeModel>? types;
  final List<PokemonHeldItemModel>? heldItems;
  final List<PokemonMoveModel>? moves;
  final String? img;
  PokemonModel({
    this.id,
    this.name,
    this.baseExp,
    this.height,
    this.isDefault,
    this.order,
    this.weight,
    this.abilities,
    this.forms,
    this.stats,
    this.types,
    this.img,
    this.heldItems,
    this.moves,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json["id"],
      name: json["name"],
      baseExp: json["base_experience"],
      height: json["height"],
      isDefault: json["is_default"],
      order: json["order"],
      weight: json["weight"],
      abilities: (json["abilities"] as List).map((e)=>PokemonAbilityModel.fromJson(e)).toList(),
      forms: (json["forms"] as List).map((e)=>PokemonFormModel.fromJson(e)).toList(),
      stats: (json["stats"] as List).map((e)=>PokemonStatModel.fromJson(e)).toList(),
      types: (json["types"] as List).map((e)=>PokemonTypeModel.fromJson(e)).toList(),
      heldItems: (json["held_items"] as List).map((e)=>PokemonHeldItemModel.fromJson(e)).toList(),
      moves: (json["moves"] as List).map((e)=>PokemonMoveModel.fromJson(e)).toList(),
      
      img: json["sprites"]["other"]["dream_world"]["front_default"],
    );
  }

  Map toJson() {
    return {
      "id": id,
      "name": name,
      "baseExp": baseExp,
      "height": height,
      "isDefault": isDefault,
      "order": order,
      "weight": weight,
      "abilities": abilities,
      "forms": forms,
      "stats": stats,
      "types": types,
      "img": img,
    };
  }
}

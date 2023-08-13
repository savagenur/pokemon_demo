part of 'pokemon_bloc.dart';

sealed class PokemonState extends Equatable {
   final List<PokemonModel> pokemons;

  const PokemonState(this.pokemons);

  @override
  List<Object> get props => [];
}

final class PokemonLoading extends PokemonState {
  const PokemonLoading(super.
  pokemons);
}

final class PokemonLoaded extends PokemonState {
  final List<PokemonModel> pokemons;

  const PokemonLoaded({
    required this.pokemons
  }) : super(pokemons);
  @override
  List<Object> get props => [
    pokemons,
  ];
}

final class PokemonFailure extends PokemonState {
  const PokemonFailure(super.pokemons);

  @override
  List<Object> get props => [];
}

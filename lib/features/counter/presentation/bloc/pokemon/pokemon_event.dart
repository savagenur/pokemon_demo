part of 'pokemon_bloc.dart';

sealed class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class GetPokemons extends PokemonEvent {
  final int offset;
  const GetPokemons({
    required this.offset,
  });
  @override
  List<Object> get props => [
    offset,
  ];
}

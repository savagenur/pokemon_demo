import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:pokemon_demo/features/counter/domain/usecases/fetch_pokemons_from_api_usecase.dart';

import '../../../data/models/pokemon/pokemon_model.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final FetchPokemonsFromApiUsecase fetchPokemonsFromApiUsecase;
  PokemonBloc({
    required this.fetchPokemonsFromApiUsecase,
  }) : super(const PokemonLoading([])) {
    on<GetPokemons>(_onGetPokemons);
  }

  FutureOr<void> _onGetPokemons(
      GetPokemons event, Emitter<PokemonState> emit) async {
    final updatedPokemons =List<PokemonModel>.from(state.pokemons) ;
    final pokemons = await fetchPokemonsFromApiUsecase.call(event.offset);
    updatedPokemons.addAll(pokemons);
    emit(PokemonLoaded(pokemons: updatedPokemons));
  }
}

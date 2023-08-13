import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokemon_demo/features/counter/data/models/pokemon/pokemon_model.dart';
import 'package:pokemon_demo/features/counter/presentation/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokemon_demo/features/counter/presentation/pages/detail/detail_page.dart';
import 'package:pokemon_demo/features/counter/presentation/pages/settings/settings_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PokemonModel> pokemons = [];
  final ScrollController controller = ScrollController();
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int offset = 20;
  bool hasMore = true;
  bool isLoading = false;

  Future fetch() async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    context.read<PokemonBloc>().add(GetPokemons(offset: offset));
    setState(() {
      offset += 20;
      isLoading = false;
    });
  }

  Future refresh() async {
    setState(() {
      isLoading = false;
      hasMore = true;
      offset = 20;
      pokemons.clear();
    });
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppLocalizations.of(context)!.pokemons),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ));
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, pokemonState) {
          if (pokemonState is PokemonLoaded) {
            pokemons = pokemonState.pokemons;
            return RefreshIndicator(
              onRefresh: refresh,
              child: ListView.builder(
                controller: controller,
                itemCount: pokemons.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index < pokemons.length) {
                    final PokemonModel pokemon = pokemons[index];
                    final String name = pokemon.name![0].toUpperCase() +
                        pokemon.name!.substring(1).toLowerCase();
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  pokemon: pokemon,
                                ),
                              ));
                        },
                        leading: pokemon.img == null
                            ? const Icon(Icons.file_copy_outlined)
                            : SvgPicture.network(
                                pokemon.img!,
                                width: 50,
                              ),
                        title: Text(name),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(30),
                      child: Center(
                        child: hasMore
                            ? const CircularProgressIndicator()
                            : const Text("No more data to load"),
                      ),
                    );
                  }
                },
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

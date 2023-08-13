import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:pokemon_demo/features/counter/data/models/pokemon/pokemon_model.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
   DetailPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String name = pokemon.name![0].toUpperCase() +
        pokemon.name!.substring(1).toLowerCase();
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             const SizedBox(
              height: 20,
            ),
            Container(
              padding:  const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * .5,
              child: SvgPicture.network(pokemon.img!),
            ),
            ListTile(
              leading:  const Icon(Icons.animation_outlined),
              title:   Text(AppLocalizations.of(context)!.name),
              trailing: Text(name),
              tileColor: Theme.of(context).highlightColor,
            ),
            ListTile(
              leading:  const Icon(Icons.animation_outlined),
              title:  Text(AppLocalizations.of(context)!.baseExp),
              trailing: Text(pokemon.baseExp?.toString()??"0"),
              
            ),
            ListTile(
              leading:  const Icon(Icons.animation_outlined),
              title:  Text(AppLocalizations.of(context)!.height),
              trailing: Text(pokemon.height?.toString()??"0"),
              tileColor: Theme.of(context).highlightColor,
            ),
            ListTile(
              leading:  const Icon(Icons.animation_outlined),
              title:  Text(AppLocalizations.of(context)!.order),
              trailing: Text(pokemon.order?.toString()??"0"),
              
            ),
            ListTile(
              leading:  const Icon(Icons.animation_outlined),
              title:  Text(AppLocalizations.of(context)!.weight),
              trailing: Text(pokemon.weight!.toString()),
              tileColor: Theme.of(context).highlightColor,
            ),
             const Divider(),
            ExpansionTile(title:  Text(AppLocalizations.of(context)!.abilities),
            initiallyExpanded: true,
            children: pokemon.abilities!.map((e) => Padding(
              padding:  const EdgeInsets.only(left: 20),
              child: ListTile(
                leading:  const Icon(Icons.star),
                title:  Text(e.name!),
              ),
            )).toList()),
             const Divider(),
            ExpansionTile(title:  Text(AppLocalizations.of(context)!.forms),
            initiallyExpanded: true,
            children: pokemon.forms!.map((e) => Padding(
              padding:  const EdgeInsets.only(left: 20),
              child: ListTile(
                leading:  const Icon(Icons.shape_line_outlined),
                title:  Text(e.name!),
              ),
            )).toList()),
             const Divider(),
            ExpansionTile(title:  Text(AppLocalizations.of(context)!.stats),
            initiallyExpanded: true,
            children: pokemon.stats!.map((e) => Padding(
              padding:  const EdgeInsets.only(left: 20),
              child: ListTile(
                leading:  const Icon(Icons.graphic_eq_outlined),
                title:  Text(e.name!),
                trailing: Text(e.baseStat!.toString()),
              ),
            )).toList()),
             const Divider(),
            ExpansionTile(title:  Text(AppLocalizations.of(context)!.types),
            initiallyExpanded: true,
            children: pokemon.types!.map((e) => Padding(
              padding:  const EdgeInsets.only(left: 20),
              child: ListTile(
                leading:  const Icon(Icons.storm),
                title:  Text(e.type!),
              ),
            )).toList()),
             const Divider(),
            ExpansionTile(title:  Text(AppLocalizations.of(context)!.heldItems),
            initiallyExpanded: true,
            children: pokemon.heldItems!.map((e) => Padding(
              padding:  const EdgeInsets.only(left: 20),
              child: ListTile(
                leading:  const Icon(Icons.auto_fix_normal_outlined),
                title:  Text(e.name!),
              ),
            )).toList()),
            ExpansionTile(title:  Text(AppLocalizations.of(context)!.moves),
            children: pokemon.moves!.map((e) => Padding(
              padding:  const EdgeInsets.only(left: 20),
              child: ListTile(
                leading:  const Icon(Icons.rocket_launch_sharp),
                title:  Text(e.name!),
              ),
            )).toList()),
             const SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}

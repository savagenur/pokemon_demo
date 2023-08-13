import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pokemon_demo/features/counter/presentation/bloc/pokemon/pokemon_bloc.dart';
import 'package:pokemon_demo/features/counter/presentation/bloc/settings/settings_bloc.dart';
import 'package:pokemon_demo/injection_container.dart';
import 'package:pokemon_demo/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'features/counter/presentation/pages/home/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<PokemonBloc>()..add(const GetPokemons(offset: 20)),
        ),
        BlocProvider(
          create: (context) => sl<SettingsBloc>()..add(GetSetting()),
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, settingsState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Pokemons",
            supportedLocales: L10n.all,
            locale: settingsState.lang!="ru"?const Locale("en"):const Locale("ru"),
            localizationsDelegates: const[
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            theme: settingsState.isDarkTheme?ThemeData.dark():ThemeData.light(),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}

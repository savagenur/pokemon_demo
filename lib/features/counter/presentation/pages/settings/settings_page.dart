import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_down_button/pull_down_button.dart';

import '../../bloc/settings/settings_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, settingsState) {
          return Column(
            children: [
              PullDownButton(
                itemBuilder: (context) {
                  return [
                    PullDownMenuItem.selectable(
                      onTap: () {
                        context
                            .read<SettingsBloc>()
                            .add(const SetTheme(isDarkTheme: true));
                      },
                      title: AppLocalizations.of(context)!.darkTheme,
                      selected: settingsState.isDarkTheme,
                    ),
                    PullDownMenuItem.selectable(
                      onTap: () {
                        context
                            .read<SettingsBloc>()
                            .add(const SetTheme(isDarkTheme: false));
                      },
                      title: AppLocalizations.of(context)!.lightTheme,
                      selected: settingsState.isDarkTheme ? false : true,
                    ),
                  ];
                },
                buttonBuilder: (context, showMenu) {
                  return ListTile(
                    leading: Icon(settingsState.isDarkTheme?Icons.dark_mode:Icons.sunny),
                    title: Text(settingsState.isDarkTheme
                        ? AppLocalizations.of(context)!.darkTheme
                        : AppLocalizations.of(context)!.lightTheme),
                    onTap: showMenu,
                  );
                },
              ),
              PullDownButton(
                itemBuilder: (context) {
                  return [
                    PullDownMenuItem.selectable(
                      onTap: () {
                        context
                            .read<SettingsBloc>()
                            .add(const SetLang(lang: "ru"));
                      },
                      title: "Русский",
                      selected: settingsState.lang == "ru",
                    ),
                    PullDownMenuItem.selectable(
                      onTap: () {
                        context
                            .read<SettingsBloc>()
                            .add(const SetLang(lang: "en"));
                      },
                      title: "English",
                      selected: settingsState.lang == "en",
                    ),
                  ];
                },
                buttonBuilder: (context, showMenu) {
                  return ListTile(
                    leading: const Icon(Icons.translate),
                    title: Text(AppLocalizations.of(context)!.language),
                    onTap: showMenu,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

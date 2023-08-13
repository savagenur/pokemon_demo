import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_demo/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState(isDarkTheme: false, lang: 'en')) {
    on<SetLang>(_onSetLang);
    on<SetTheme>(_onSetTheme);
    on<GetSetting>(_onGetSetting);
  }

  FutureOr<void> _onSetLang(SetLang event, Emitter<SettingsState> emit) async {
    await sl<SharedPreferences>().setString("lang", event.lang);
    final String? lang = sl<SharedPreferences>().getString("lang");
    emit(SettingsState(isDarkTheme: state.isDarkTheme, lang: lang!));
  }

  FutureOr<void> _onSetTheme(
      SetTheme event, Emitter<SettingsState> emit) async {
         await sl<SharedPreferences>().setBool("isDarkTheme", event.isDarkTheme);
    final bool? isDarkTheme = sl<SharedPreferences>().getBool("isDarkTheme");
    emit(SettingsState(isDarkTheme: isDarkTheme!, lang: state.lang));
      }

  void _onGetSetting(GetSetting event, Emitter<SettingsState> emit) {
    final String lang = sl<SharedPreferences>().getString("lang") ?? "en";
    final bool isDarkTheme =
        sl<SharedPreferences>().getBool("isDarkTheme") ?? false;

    emit(SettingsState(isDarkTheme: isDarkTheme, lang: lang));
  }
}

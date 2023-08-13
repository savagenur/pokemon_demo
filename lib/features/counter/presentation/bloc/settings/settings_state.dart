part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final bool isDarkTheme;
  final String lang;
  const SettingsState({
    required this.isDarkTheme,
    required this.lang,

  });

  @override
  List<Object> get props => [
    isDarkTheme,
    lang,
  ];
}

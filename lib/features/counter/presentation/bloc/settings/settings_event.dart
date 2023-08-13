part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SetTheme extends SettingsEvent {
  final bool isDarkTheme;
  const SetTheme({
    required this.isDarkTheme,
  });
  @override
  List<Object> get props => [
    isDarkTheme,
  ];
}
class SetLang extends SettingsEvent {
  final String lang;
  const SetLang({
    required this.lang,
  });
  @override
  List<Object> get props => [
    lang,
  ];
}
class GetSetting extends SettingsEvent {
 
  @override
  List<Object> get props => [
  ];
}

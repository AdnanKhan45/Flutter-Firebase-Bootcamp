part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ChangeThemeEvent extends ThemeEvent {
  final String name;

  ChangeThemeEvent({required this.name});

  @override
  List<Object?> get props => [name];
}

class GetPreservedThemeEvent extends ThemeEvent {

  GetPreservedThemeEvent();

  @override
  List<Object?> get props => [];
}

class GetPreservedThemeLoadEvent extends ThemeEvent {
  final String name;

  GetPreservedThemeLoadEvent(this.name);

  @override
  List<Object?> get props => [name];
}




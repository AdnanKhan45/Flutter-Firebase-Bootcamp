part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class ThemeInitial extends ThemeState {
  @override
  List<Object> get props => [];
}

class ThemeLoaded extends ThemeState {
  final ThemeData themeData;

  ThemeLoaded({required this.themeData});
  @override
  List<Object> get props => [themeData];
}

class PreservedThemeLoaded extends ThemeState {
  final String name;
  const PreservedThemeLoaded({required this.name});

  @override
  List<Object?> get props => [name];
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/lessons/week_2/20_theme/local/shared_preferences.dart';
import 'package:flutter_basics/lessons/week_2/20_theme/preferences/theme_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ChangeThemeEvent>((event, emit) {
      SharedPref.setThemeID(value: event.name);
      emit(ThemeLoaded(themeData: appThemeData[event.name]!));
    });

    on<GetPreservedThemeEvent>((event, emit) {
      SharedPref.getThemeID().then((value) {
        add(GetPreservedThemeLoadEvent(value));
      });
    });

    on<GetPreservedThemeLoadEvent>((event, emit) {
      emit(PreservedThemeLoaded(name: event.name));
    });
  }
}

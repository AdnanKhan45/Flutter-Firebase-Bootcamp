
import 'package:flutter/material.dart';
import 'package:flutter_basics/lessons/week_2/20_theme/bloc/theme/theme_bloc.dart';
import 'package:flutter_basics/lessons/week_2/20_theme/preferences/theme_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemePreferencesPage extends StatelessWidget {
  const ThemePreferencesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Preferences"),
      ),
      body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          itemCount: ThemePref.themePrefList.length,itemBuilder: (context, index) {

            final selectedThemeName = ThemePref.themePrefList[index];
        return GestureDetector(
          onTap: () {
            BlocProvider.of<ThemeBloc>(context).add(ChangeThemeEvent(name: selectedThemeName));
          },
          child: Container(
            margin: EdgeInsets.all(8),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              border:Border.all(width: 1, color: Colors.black54),
              color: appThemeData[selectedThemeName]!.primaryColor
            ),
            child: Center(child: Text(selectedThemeName, style: appThemeData[selectedThemeName]!.textTheme.bodyMedium,),),
          ),
        );
      }),
    );
  }
}

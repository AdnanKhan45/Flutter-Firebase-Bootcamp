import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/lessons/week_2/18_bloc_section_1/bloc/counter/counter_bloc.dart';
import 'package:flutter_basics/lessons/week_2/18_bloc_section_1/cubit/counter/counter_cubit.dart';
import 'package:flutter_basics/lessons/week_2/19_bloc_section_2/bloc/firebase_crud/firebase_crud_bloc.dart';
import 'package:flutter_basics/lessons/week_2/19_bloc_section_2/cubit/firebase_crud/firebase_cruds_cubit.dart';
import 'package:flutter_basics/lessons/week_2/20_theme/bloc/theme/theme_bloc.dart';
import 'package:flutter_basics/lessons/week_2/20_theme/preferences/theme_preferences.dart';
import 'package:flutter_basics/lessons/week_2/20_theme/preferences/theme_preferences_page.dart';
import 'package:flutter_basics/lessons/week_2/21_firebase_email_and_google_auth/auth_success_page.dart';
import 'package:flutter_basics/lessons/week_2/21_firebase_email_and_google_auth/sign_in_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA9K0_oefECfbus5G7KRidMxEms4FfXqsw",
            authDomain: "flutter-firebase-basics-43d44.firebaseapp.com",
            projectId: "flutter-firebase-basics-43d44",
            storageBucket: "flutter-firebase-basics-43d44.appspot.com",
            messagingSenderId: "307619313524",
            appId: "1:307619313524:web:9321a9e29267234a93de21",
            measurementId: "G-DWM3MV5RMM"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc()..add(GetPreservedThemeEvent()),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => FirebaseCrudBloc()..add(ReadDataEvent()),
        ),
        BlocProvider(create: (context) => FirebaseCrudsCubit()..readData()),
      ],
      child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(primarySwatch: Colors.blue),
                home: AuthSuccessPage(),
              );
            } else {
              return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(primarySwatch: Colors.blue),
                home: SignInPage(),
              );
            }
          }
      ),
    );
  }

  // BlocBuilder<ThemeBloc, ThemeState>(
  // builder: (context, state) {
  // if(state is ThemeLoaded) {
  // return MaterialApp(
  // title: 'Flutter Demo',
  // debugShowCheckedModeBanner: false,
  // theme: state.themeData,
  // home: MyHomePage(),
  // );
  // }
  // if(state is PreservedThemeLoaded) {
  // return MaterialApp(
  // title: 'Flutter Demo',
  // debugShowCheckedModeBanner: false,
  // theme: _switchTheme(state.name),
  // home: MyHomePage(),
  // );
  // }
  // return MaterialApp(
  // title: 'Flutter Demo',
  // debugShowCheckedModeBanner: false,
  // theme: ThemeData(
  // primarySwatch: Colors.blue
  // ),
  // home: MyHomePage(),
  // );
  // },
  // ),

  ThemeData _switchTheme(String name) {
    switch (name) {
      case ThemePref.lightTheme:
        {
          return appThemeData[ThemePref.lightTheme]!;
        }
      case ThemePref.darkTheme:
        {
          return appThemeData[ThemePref.darkTheme]!;
        }
      case ThemePref.deepOrangeThemeLight:
        {
          return appThemeData[ThemePref.deepOrangeThemeLight]!;
        }
      case ThemePref.deepPurpleThemeLight:
        {
          return appThemeData[ThemePref.deepPurpleThemeLight]!;
        }
      default:
        {
          return ThemeData(primarySwatch: Colors.blue);
        }
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Themes App"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThemePreferencesPage()));
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: Center(
        child: Text(
          "Play with Themes",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/logic/post_bloc.dart';
import 'package:posts/logic/post_event.dart';
import 'package:posts/logic/profiles_bloc.dart';
import 'package:posts/logic/profiles_event.dart';
import 'package:posts/nav_bar.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => PostBloc()..add(LoadPost())),
    BlocProvider(create: (context) => ProfilesBloc()..add(LoadProfiles()))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.dark,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              color: Colors.white,
            ),
            scaffoldBackgroundColor: Colors.white,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 233, 30, 99))),
        debugShowCheckedModeBanner: false,
        home: NavBar());
  }
}

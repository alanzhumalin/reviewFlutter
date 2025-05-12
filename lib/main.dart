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
    return MaterialApp(home: NavBar());
  }
}

import 'package:custom_container/home/bloc/item_bloc.dart';
import 'package:custom_container/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// The main entrypoint for the application.
///
/// Initializes the BlocProvider with an ItemBloc, and runs the MyApp widget.
void main() {
  runApp(BlocProvider(create: (context) => ItemBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

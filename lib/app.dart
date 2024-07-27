import 'package:flutter/material.dart';
import 'package:workouts/features/home/presentation/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  static run() => runApp(const App());

  @override
  Widget build(BuildContext context) {
    return const MaterialContext();
  }
}

class MaterialContext extends StatelessWidget {
  const MaterialContext({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workouts',
      home: HomeScreen(),
    );
  }
}

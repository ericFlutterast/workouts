import 'package:flutter/material.dart';
import 'package:workouts/common/navigation/app_navigator.dart';
import 'package:workouts/common/navigation/navigator.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Workouts',
      home: AppNavigator(
        initPath: Uri.parse('home'),
        child: const AppRoot(),
      ),
    );
  }
}

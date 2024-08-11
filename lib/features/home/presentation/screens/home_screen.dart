import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: 25,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            height: 60,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
